package main

import (
	"fmt"
	"net/http"
)

func myWeb(w http.ResponseWriter, r *http.Request) {
	r.ParseForm()
	for k, v := range r.URL.Query() {
		fmt.Println("key:", k, ",value:", v[0])
	}
	for k, v := range r.PostForm {
		fmt.Println("key:", k, ",value:", v[0])
	}
	fmt.Fprintln(w, "this is a beginning")
}

func main() {
	http.HandleFunc("/", myWeb)
	fmt.Println("server is starting, visit: http://localhost:8080")
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		fmt.Println("server started with error: ", err)
	}
}
