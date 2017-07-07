# Build software
FROM debian:stable
RUN apt-get update && apt-get install -y \
  wget \
  xz-utils \
  && rm -rf /var/lib/apt/lists/*
RUN wget -O - https://developer.salesforce.com/media/salesforce-cli/sfdx-v5.7.6-d42cf65-linux-amd64.tar.xz | tar Jxv
RUN sfdx/install

# Run software
FROM debian:stable-slim
CMD ["sfdx"]
COPY --from=0 /usr/local/bin/sfdx /usr/local/bin
COPY --from=0 /root/.local/share/sfdx/cli .local/share/sfdx/cli
RUN apt-get update && apt-get install -y \
  ca-certificates \
  && rm -rf /var/lib/apt/lists/*
RUN sfdx
