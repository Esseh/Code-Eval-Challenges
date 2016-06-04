package main

import(
	"fmt"
	"log"
	"bufio"
	"os"
	"strings"
)


func main() {
    file, err := os.Open(os.Args[1])
    if err != nil {
        log.Fatal(err)
    }   
    defer file.Close()
    scanner := bufio.NewScanner(file)
	// For each line...
    for scanner.Scan() {
		// Print the lowercase equivalent.
        fmt.Println(strings.ToLower(scanner.Text()))
    }   
}