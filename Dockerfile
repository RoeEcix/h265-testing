FROM ubuntu:22.04

# Install wget
RUN apt-get update && apt-get install -y wget

# Download go2rtc
RUN wget https://github.com/AlexxIT/go2rtc/releases/latest/download/go2rtc_linux_amd64
RUN chmod +x go2rtc_linux_amd64
RUN mv go2rtc_linux_amd64 /usr/local/bin/go2rtc

# Create config directory
RUN mkdir -p /etc/go2rtc

# Add configuration file
COPY config.yaml /etc/go2rtc/config.yaml

# Expose port
EXPOSE 1984
EXPOSE 8554
EXPOSE 8558

# Set working directory
WORKDIR /etc/go2rtc

# Run go2rtc
CMD ["/usr/local/bin/go2rtc"]
