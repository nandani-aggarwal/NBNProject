FROM adoptopenjdk/openjdk11:alpine-slim
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar
EXPOSE 8080 9090 8081 8082 9091
ENTRYPOINT ["java","-jar","/app.jar"]