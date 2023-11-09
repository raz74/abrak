# Start from golang base image
FROM golang:1.21.0-alpine as builder

# Set the current working directory
WORKDIR /app

# Copy the source from the current directory to the working Directory inside the container
COPY . .

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags "-s -w" -a -installsuffix cgo -o main .

FROM alpine

WORKDIR /app

COPY --from=builder /app/main main
COPY --from=builder /app/default.env default.env

# Expose ports to the outside world
EXPOSE 8008

#Command to run the executable
ENTRYPOINT ["/app/main"]

