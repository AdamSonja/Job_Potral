# Use official OpenJDK image
FROM eclipse-temurin:17-jdk-alpine

# Set environment variables
ENV APP_HOME=/app
WORKDIR $APP_HOME

# Copy the built jar into the container
COPY target/JobApp-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080
EXPOSE 8080

# Run the jar
ENTRYPOINT ["java","-jar","app.jar"]
