# Introduction

This image is built to run on ARMv7 devices, like the Raspberry Pi 2. It can be used to build and run Java programs using Oracle Java 8.

[Source code is on GitHub](https://github.com/oysteinjakobsen/docker-armv7-oracle-java8)

# How to use this image

## Run a simple Java program

The image has a mount-point `/data` that can be used to supply the Java program to the container. Here's how to run a small Java program `/myapp/MyApp.class`:

```
docker run \
  --rm -it \
  -v /myapp:/data \
  oysteinjakobsen/armv7-oracle-java8 \
  java /data/MyApp.class
```

## Running a webapp

Let's assume you have a webapp packaged as a jar with an embedded Jetty container. Then you can run your program like this:

```
docker run \
  --rm -it \
  -p 8080:8080 \
  -v /myapp:/data \
  oysteinjakobsen/armv7-oracle-java8 \
  java -jar /data/MyWebApp.jar
```

## Making your own image

You can also package your application in your own image by creating a `Dockerfile`:

```
FROM oysteinjakobsen/armv7-oracle-java8
ADD /projects/mywebapp /data
EXPOSE 8080
CMD ["java" "-jar" "/data/mywebapp/MyWebApp.jar"]
```

Rembember that the image must be built on the ARMv7 device.

