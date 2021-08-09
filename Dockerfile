FROM openjdk:8-alpine
ADD target/ app.jar
EXPOSE 8080
ENV HOST=my-db
ENTRYPOINT ["java","-jar","app.jar"]
