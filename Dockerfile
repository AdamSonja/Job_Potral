# =========================
# Stage 1: Build the JAR
# =========================
FROM maven:3.9.3-eclipse-temurin-17 AS build
WORKDIR /app

# Copy Maven config first (for caching dependencies)
COPY pom.xml .

# Copy the project source code, including JSPs
COPY src ./src
COPY src/main/webapp ./src/main/webapp

# Build the project without running tests
RUN mvn clean package -DskipTests

# =========================
# Stage 2: Run the App
# =========================
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Copy the built JAR from the build stage
COPY --from=build /app/target/JobApp-0.0.1-SNAPSHOT.jar app.jar

# Expose the port (Render will inject $PORT)
EXPOSE 8080

# Command to run your Spring Boot app with Render's dynamic port
CMD ["sh", "-c", "java -Dserver.port=$PORT -jar app.jar"]
