#Build springboot jar file
FROM openjdk:11-jdk
RUN apt-get update
RUN apt-get install maven -y
COPY . .
#Build jar
RUN mvn package
RUN ls -a
RUN cd target 
RUN ls -a
EXPOSE 8080
ENTRYPOINT ["java","-jar","/target/DockerTest-0.0.1-SNAPSHOT.jar"]  
