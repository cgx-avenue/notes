$root = "C:\dev\notes"
$allFiles = Get-ChildItem -Path $root -Recurse -File -Force | Where-Object { $_.FullName -notmatch '\\\.git\\' -and $_.FullName -notmatch '\\\.obsidian\\' }
$nameMap = @{}
foreach ($af in $allFiles) { $nameMap[$af.Name] = $true }

function Get-WikiBase([string]$raw) {
    $s = $raw
    $s = ($s -split '\|')[0]          # strip alias
    $s = ($s -split '#')[0]           # strip heading
    $s = ($s -split '\^')[0]          # strip block
    return $s.Trim()
}

function Test-WikiTarget([string]$name, [string]$rootPath) {
    if ($name -match '[/\\]') {
        $p = Join-Path $rootPath ($name -replace '/', '\')
        return (Test-Path $p -ErrorAction SilentlyContinue)
    }
    if ($nameMap.ContainsKey($name)) { return $true }
    if ($name -notmatch '\.') {
        $cand = $name + '.md'
        if ($nameMap.ContainsKey($cand)) { return $true }
    }
    return $false
}

$results = @()
$mdFiles = $allFiles | Where-Object { $_.Extension -eq '.md' }
foreach ($f in $mdFiles) {
    $dir = $f.DirectoryName
    $lines = Get-Content -Path $f.FullName -Encoding UTF8 -ErrorAction SilentlyContinue
    if ($null -eq $lines) { continue }
    $rel = $f.FullName.Replace($root, '')
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        $ln = $i + 1
        foreach ($m in [regex]::Matches($line, '!\[\[([^\]]+)\]\]')) {
            $t = Get-WikiBase $m.Groups[1].Value
            if ($t -eq '') { continue }
            if (-not (Test-WikiTarget $t $root)) { $results += "EMBED|$rel|$ln|$($m.Groups[0].Value)|$t" }
        }
        foreach ($m in [regex]::Matches($line, '(?<!\!)\[\[([^\]]+)\]\]')) {
            $t = Get-WikiBase $m.Groups[1].Value
            if ($t -eq '') { continue }
            if (-not (Test-WikiTarget $t $root)) { $results += "WIKI|$rel|$ln|$($m.Groups[0].Value)|$t" }
        }
        foreach ($m in [regex]::Matches($line, '!\[[^\]]*\]\(([^)]+)\)')) {
            $p = $m.Groups[1].Value.Trim()
            if ($p -match '^(https?://|file://|data:)') { continue }
            $p = (($p -split '\s+')[0] -split '#')[0]
            if ($p -eq '') { continue }
            $resolved = Join-Path $dir ($p -replace '/', '\')
            if (-not (Test-Path $resolved -ErrorAction SilentlyContinue)) { $results += "IMG|$rel|$ln|$($m.Groups[0].Value)|$p" }
        }
        foreach ($m in [regex]::Matches($line, '(?<!\!)\[[^\]]*\]\(([^)]+)\)')) {
            $p = $m.Groups[1].Value.Trim()
            if ($p -match '^(https?://|file://|mailto:|data:)') { continue }
            if ($p -match '\.(md|png|jpg|jpeg|gif|webp|pdf|docx|xlsx|pptx|zip|txt)(\s|#|$)') {
                $p = (($p -split '\s+')[0] -split '#')[0]
                if ($p -eq '') { continue }
                $resolved = Join-Path $dir ($p -replace '/', '\')
                if (-not (Test-Path $resolved -ErrorAction SilentlyContinue)) { $results += "LINK|$rel|$ln|$($m.Groups[0].Value)|$p" }
            }
        }
    }
}

Write-Output "===== 断链总数: $($results.Count) ====="
Write-Output ""
Write-Output "===== 按类型统计 ====="
$results | ForEach-Object { ($_ -split '\|')[0] } | Group-Object | Sort-Object Count -Descending | Select-Object Count, Name | Format-Table -AutoSize
Write-Output "===== 断链明细 ====="
$results | ForEach-Object { $_ }
