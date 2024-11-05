FROM alpine:latest

RUN apk add --update dnsmasq

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
# Copy config files for dnsmasq, and running as a service
#COPY etc /etc/
COPY etc/dnsmasq.conf /etc/dnsmasq.d/dnsmasq.conf

# Set the start of the IP range to reply to PXE DHCP requests on
ENV DHCP_RANGE_START=192.168.1.1

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
