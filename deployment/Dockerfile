FROM openjdk:8-alpine

RUN mkdir -p /app/bin

COPY sample-service-app-1.0.jar /app/bin

COPY runApp.sh /app/bin

WORKDIR /app/bin

ENTRYPOINT ["/bin/sh","runApp.sh"]
