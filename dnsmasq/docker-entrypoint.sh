#!/bin/sh

if [ -z ${CONTAINER_IP} ]; then
    CONTAINER_IP=$(ip route get to 1.1.1.1 | awk '/1.1.1.1/ { print $7}')
fi

# Start dnsmasq
exec dnsmasq --no-daemon --dhcp-range=${DHCP_RANGE_START},proxy \
    --dhcp-boot=tag:ipxe-bios,netboot.xyz.kpxe,,${CONTAINER_IP} \
    --dhcp-boot=tag:ipxe-efi,netboot.xyz.efi,,${CONTAINER_IP} \
    ${DNSMASQ_ARGS}
