package main

import (
	"fmt"
	"net/http"
	"text/template"
)

func myWeb(w http.ResponseWriter, r *http.Request) {
	t := template.New("index")
	t.Parse("<div id='templateTextDiv'>Hi, {{.name}},{{.someStr}}</div>")
	data := map[string]string{
		"name":"zeta",
		"someStr":"this is a beginning",
	}
	t.Execute(w,data)
}

func main() {
	http.HandleFunc("/", myWeb)
	fmt.Println("server is starting, visit: http://localhost:8080")
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		fmt.Println("server started with error: ", err)
	}
}
