#Build springboot jar file
FROM openjdk:11-jdk
RUN apt-get update
RUN apt-get install maven -y
COPY . .
RUN mvn package

# Copy the exe into a smaller base image
FROM openjdk:11-jdk-slim
RUN ls
EXPOSE 8080
ENTRYPOINT ["java","-jar","/target/DockerTest-0.0.1-SNAPSHOT.jar "]  
