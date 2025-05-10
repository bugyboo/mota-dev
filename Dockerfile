FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:alpine

# Install JDK 21 sdk & Maven tools
RUN apk --update-cache add openjdk21-jdk maven \
    && rm -rf /var/cache/apk/*

RUN git config --global user.email "dev@nervelife.com" && \
    git config --global user.name "dev"
