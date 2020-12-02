#Build springboot jar file
FROM openjdk:11-jdk
RUN apt-get update
RUN apt-get install maven -y
COPY . .
RUN ls
RUN mvn package

# Copy the exe into a smaller base image
FROM openjdk:11-jdk-slim
COPY /target/DockerTest-0.0.1-SNAPSHOT.jar springdoc.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/springdoc.jar"]  
