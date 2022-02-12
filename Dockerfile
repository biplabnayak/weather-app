FROM openjdk:11-jre-slim
RUN mkdir "app"
COPY target/weather-app-0.0.1-SNAPSHOT.jar /app/app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]