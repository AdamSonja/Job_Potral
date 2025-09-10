# =========================
# Stage 1: Build the JAR
# =========================
FROM maven:3.9.3-eclipse-temurin-17 AS build
WORKDIR /app

# Copy Maven config and source code
COPY pom.xml .
COPY src ./src

# Build the project without running tests
RUN mvn clean package -DskipTests

# =========================
# Stage 2: Run the App
# =========================
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Copy the JAR from the build stage
COPY --from=build /app/target/JobApp-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your app runs on
EXPOSE 8080

# Command to run your Spring Boot app
CMD ["java", "-jar", "app.jar"]
