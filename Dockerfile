# Linux image we are using
FROM alpine
WORKDIR .
COPY . .

#Install JDK
RUN apk add openjdk8
# ENV JAVA_HOME /usr/lib/jvm/
