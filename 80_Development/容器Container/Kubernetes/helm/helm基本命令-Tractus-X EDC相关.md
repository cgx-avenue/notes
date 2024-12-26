# 1. 列出 Helm 部署

列出当前命名空间中的 Helm 部署：

```undefined
helm list
```

要列出特定命名空间中的部署，请使用：

```cpp
helm list --namespace <namespace_name>
```

通过运行以下命令列出所有命名空间中的所有 Helm 部署：

```css
helm list --all-namespaces
```

# 2. 删除 Helm 部署

要删除已安装的 Helm 部署，请运行：

```xml
helm uninstall <deployment name> --namespace <namespace_name>
```

或者，使用别名：

```cpp
helm delete <deployment name> --namespace <namespace_name>
```

终端输出移除确认。例如，下面的命令删除命名空间_other_上名为_phoenix-chart_的部署：

```cpp
helm uninstall phoenix-chart --namespace other
```



# 举例
## Tractus-X helm chart部署
```bash
2069  helm install -f values-adopter-data-exchange.yaml umbrella . --namespace umbrella --create-namespace
 2070  helm list
 2071  helm install -f values-adopter-data-exchange.yaml umbrella . --namespace umbrella --create-namespace
 2072  helm uninstall umbrella --namespace umbrella
 2073  sudo vim values-adopter-data-exchange.yaml 
 2074  helm install -f values-adopter-data-exchange.yaml umbrella . --namespace umbrella --create-namespace
 2075  helm
 2076  helm status
 2077  helm status umbrella
 2078  helm list
 2079  helm uninstall umbrella --namespace umbrella
 2080  helm repo add tractusx-dev https://eclipse-tractusx.github.io/charts/dev
 2081  helm install   --set centralidp.enabled=true,managed-identity-wallet.enabled=true,dataconsumerOne.enabled=true,tx-data-provider.enabled=true   umbrella tractusx-dev/umbrella   --namespace umbrella   --create-namespace
 2082  helm uninstall umbrella --namespace umbrella
 2083  helm install   --set centralidp.enabled=true,managed-identity-wallet.enabled=true,dataconsumerOne.enabled=true,tx-data-provider.enabled=true   umbrella tractusx-dev/umbrella   --namespace umbrella   --create-namespace
 2084  helm uninstall umbrella --namespace umbrella

```


