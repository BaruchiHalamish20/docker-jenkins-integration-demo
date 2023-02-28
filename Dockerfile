FROM openjdk:8
EXPOSE 8080
ADD target/docker-jenkins-integration-demo.jar docker-jenkins-integration-demo.jar
ENTRYPOINT ["java","-cp docker-jenkins-integration-demo.jar"," Test"]
#RUN ["java -cp docker-jenkins-integration-demo.jar Test"]