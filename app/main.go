package main

import (
	"context"
	"encoding/json"
	"time"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/joho/godotenv"
)

type TimeResponse struct {
	CurrentTime string `json:"current_time"`
	Timestamp   int64  `json:"timestamp"`
	Timezone    string `json:"timezone"`
	Message     string `json:"message"`
	Env         string `json:"env"`
}

func handler(ctx context.Context, request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	now := time.Now()

	response := TimeResponse{
		CurrentTime: now.Format("2006-01-02 15:04:05"),
		Timestamp:   now.Unix(),
		Timezone:    now.Location().String(),
		Message:     "Hora atual retornada com sucesso!",
	}

	body, err := json.Marshal(response)

	if err != nil {
		return events.APIGatewayProxyResponse{
			StatusCode: 500,
			Body:       `{"error": "Erro ao processar resposta"}`,
		}, err
	}

	return events.APIGatewayProxyResponse{
		StatusCode: 200,
		Headers: map[string]string{
			"Content-Type":                "application/json",
			"Access-Control-Allow-Origin": "*",
		},
		Body: string(body),
	}, nil
}

func main() {
	godotenv.Load()
	lambda.Start(handler)
}
