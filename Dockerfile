FROM openjdk:11
RUN "apt-get update && apt-get install maven"
RUN "mvn clean install -DskipTests"
ADD target/sonarscanner-maven-basic-1.0-SNAPSHOT.jar app.jar
EXPOSE 8080
ENV HOST=my-db
ENTRYPOINT ["java","-jar","app.jar"]
