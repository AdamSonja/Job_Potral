# =========================
# Stage 1: Build the WAR
# =========================
FROM maven:3.9.3-eclipse-temurin-17 AS build
WORKDIR /app

# Copy Maven config first (for caching dependencies)
COPY pom.xml .

# Copy the project source code
COPY src ./src

# Build the WAR without tests
RUN mvn clean package -DskipTests

# =========================
# Stage 2: Run the WAR in Tomcat
# =========================
FROM tomcat:10.1.17-jdk17
# Remove default ROOT webapp
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy WAR as ROOT
COPY --from=build /app/target/JobApp-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
