FROM openjdk:17-jdk-slim
WORKDIR /app

COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY src src

RUN ./gradlew clean build

COPY build/libs/docker-test-v2-0.0.1-SNAPSHOT.jar app.jar

CMD ["java", "-jar", "app.jar"]
