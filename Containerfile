ARG FEDORA_MAJOR_VERSION=37

FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_MAJOR_VERSION}
# See https://pagure.io/releng/issue/11047 for final location

COPY etc /etc

COPY ublue-firstboot /usr/bin

RUN rpm-ostree install distrobox gnome-tweaks just && \
    ostree container commit

# RUN chmod -R 777 /var/lib/nordvpn

# COPY nordvpn /var/lib/nordvpn