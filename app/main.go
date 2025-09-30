package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"time"
)

type TimeResponse struct {
	CurrentTime string `json:"current_time"`
	Timestamp   int64  `json:"timestamp"`
	Timezone    string `json:"timezone"`
}

func getCurrentTimeHandler(w http.ResponseWriter, r *http.Request) {
	now := time.Now()

	response := TimeResponse{
		CurrentTime: now.Format("2006-01-02 15:04:05"),
		Timestamp:   now.Unix(),
		Timezone:    now.Location().String(),
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

func main() {
	http.HandleFunc("/time", getCurrentTimeHandler)
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "API está rodando! Acesse /time para ver a hora atual")
	})

	port := ":8080"
	fmt.Printf("Servidor rodando em http://localhost%s\n", port)
	fmt.Println("Acesse http://localhost:8080/time para ver a hora atual")

	log.Fatal(http.ListenAndServe(port, nil))
}
