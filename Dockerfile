FROM openjdk:8

# Set up the Environment Variable for Application
ENV APP_HOME=/app

# Create the directories for Application
RUN mkdir -p ${APP_HOME}

# Setting up the Work directory
WORKDIR ${APP_HOME}

# Copying the artifact from host machine to containers
COPY target/docker-jenkins-integration-demo.jar  ${APP_HOME}

ENTRYPOINT java -cp docker-jenkins-integration-demo.jar Test


#ENV CLASSPATH=./docker-jenkins-integration-demo.jar

#CMD java Test

#ENTRYPOINT ["echo", "Running test"]
#ENTRYPOINT ["java","-cp", "docker-jenkins-integration-demo.jar","test"]