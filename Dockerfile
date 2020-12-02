#Build springboot jar file
FROM 3.6.3-jdk-11
COPY pom.xml /
COPY /scr /src
RUN mvn package

# Copy the exe into a smaller base image
FROM openjdk:11-jdk-slim
COPY /target/DockerTest-0.0.1-SNAPSHOT.jar springdoc.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/springdoc.jar"]  
