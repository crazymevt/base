ARG FEDORA_MAJOR_VERSION=38

FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_MAJOR_VERSION}
# See https://pagure.io/releng/issue/11047 for final location

COPY etc /etc

COPY ublue-firstboot /usr/bin

RUN rpm-ostree install distrobox gnome-tweaks just \
        openssl sshfs openrgb openrgb-udev-rules \
        zsh rclone protonvpn libappindicator-gtk3 wireguard-tools && \
    ostree container commit

