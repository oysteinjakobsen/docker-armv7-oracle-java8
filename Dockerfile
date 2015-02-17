#
# Debian Wheezy ARMv7hf image with Oracle Java 8, meant for use on Raspberry Pi 2 and similar devices.
#
# See https://github.com/oysteinjakobsen/docker-armv7-oracle-java8
#

FROM resin/armv7hf-debian:wheezy

MAINTAINER Øystein Jakobsen <oystein.jakobsen@bouvet.no>

# Install latest Java 8 from Oracle, set it as default, and clean up
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  apt-get install -y oracle-java8-set-default && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Set environment
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Mount-point for data, typically your Java app
VOLUME ["/data"]

# Default is a shell
CMD ["bash"]

