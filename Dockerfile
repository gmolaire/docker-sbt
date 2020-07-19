ARG OPENJDK_TAG=11.0.8-jdk
FROM openjdk:${OPENJDK_TAG}

ARG SBT_VERSION=1.3.13

RUN if [ -z "$(command -v yum)" ] ; \
    then \
        curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
        dpkg -i sbt-$SBT_VERSION.deb && \
        rm sbt-$SBT_VERSION.deb && \
        apt-get update && \
        apt-get install sbt && \
        sbt sbtVersion; \
    else \
        curl https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo && \
        yum update && \
        yum install -y sbt-$SBT_VERSION && \
        sbt sbtVersion; \
    fi
