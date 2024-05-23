#FROM openjdk:17-jdk-slim
#WORKDIR /app
#
#COPY gradlew .
#COPY gradle gradle
#COPY build.gradle .
#COPY settings.gradle .
#COPY src src
#
#RUN ./gradlew clean build
#
#COPY build/libs/docker-test-v2-0.0.1-SNAPSHOT.jar app.jar
#
#CMD ["java", "-jar", "app.jar"]

# Use the official OpenJDK image as the base image
FROM openjdk:17-jdk-slim as builder

# Set the working directory inside the container
WORKDIR /app

# Copy Gradle wrapper and configuration files
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .

# Copy the source code
COPY src src

# Run Gradle build
RUN ./gradlew clean build

# Use a smaller base image for the runtime
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file from the previous stage
COPY --from=builder /app/build/libs/docker-test-v2-0.0.1-SNAPSHOT.jar app.jar

# Command to run the application
CMD ["java", "-jar", "app.jar"]
