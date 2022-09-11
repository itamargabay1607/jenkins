FROM jenkins/jenkins:latest

ENV JENKINS_USER admin
ENV JENKINS_PASS admin

EXPOSE 8080

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
USER root
RUN apk add docker
RUN apk add py-pip

USER jenkins
