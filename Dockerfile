FROM frolvlad/alpine-oraclejdk8:slim

MAINTAINER Andrei Varabyeu <andrei_varabyeu@epam.com>
LABEL version="3.0.0-RC1"
LABEL description="EPAM Report portal. Rally Integration"

ENV APP_FILE service-rally-3.0.0-RC1
ENV APP_DOWNLOAD_URL https://dl.bintray.com/epam/reportportal/com/epam/reportportal/service-rally/3.0.0-RC1/$APP_FILE.jar
ENV JAVA_OPTS="-Xmx256m"

VOLUME /tmp
ADD $APP_DOWNLOAD_URL /app.jar
RUN sh -c 'touch /app.jar'
EXPOSE 8080
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar"]
