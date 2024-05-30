FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:alpine

# Install JDK 17 sdk & Maven tools
RUN apk --update-cache add openjdk17-jdk maven \
    && rm -rf /var/cache/apk/*
WORKDIR /home
CMD /bin/sh install.sh
