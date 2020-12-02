FROM openjdk:11-jdk
# Install maven to build jar
RUN apt-get update
RUN apt-get install maven -y

# Copy entire folder (src and pom.xml) to docker
COPY . .

#Build jar
RUN mvn package

# A dir /target is created after build. You need to change the working directory to access the jar
WORKDIR target
# RUN ls

EXPOSE 8080
ENTRYPOINT ["java","-jar","DockerTest-0.0.1-SNAPSHOT.jar"]
