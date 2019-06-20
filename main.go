package main

import (
	"fmt"
	"log"
	"net/http"
)

func Handler() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		fmt.Printf("%+v", r)
		_, _ = fmt.Fprint(w, "Hi")
	}
}

func main() {
	var s string
	_, err := fmt.Scan(&s)
	fmt.Println(err)
	fmt.Println(s)
	fmt.Println("Running on https://localhost:8080")
	log.Fatal(http.ListenAndServe(":8080", Handler()))
}
