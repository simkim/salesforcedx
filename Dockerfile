FROM debian:stable-slim
RUN apt-get update && apt-get install -y \
  wget \
  xz-utils \
  ca-certificates \
  && rm -rf /var/lib/apt/lists/*
RUN mkdir sfdx
RUN wget -O - https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz | tar Jxv --strip-components 1 -C sfdx && \
    sfdx/install && \
    rm -rf sfdx
RUN sfdx update
CMD ["sfdx"]
