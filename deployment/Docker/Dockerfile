FROM openjdk:8-alpine

RUN mkdir -p /app/bin

COPY target/sample-service-app-1.0.jar /app/bin

COPY deployment/runApp /app/bin

WORKDIR /app/bin

ENTRYPOINT ["/bin/bash"]
