FROM debian:stable-slim
RUN apt-get update && apt-get install -y \
  wget \
  xz-utils \
  ca-certificates \
  && rm -rf /var/lib/apt/lists/*
RUN wget -O - https://developer.salesforce.com/media/salesforce-cli/sfdx-v5.7.6-d42cf65-linux-amd64.tar.xz | tar Jxv
RUN sfdx/install
RUN sfdx update
CMD ["sfdx"]
