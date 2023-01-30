ARG FEDORA_MAJOR_VERSION=37

FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_MAJOR_VERSION}
# See https://pagure.io/releng/issue/11047 for final location

COPY etc /etc

COPY ublue-firstboot /usr/bin

RUN rpm-ostree override remove firefox firefox-langpacks && \
    rpm-ostree install distrobox gnome-tweaks just protonvpn libappindicator-gtk3 microsoft-edge-dev \
        nordvpn openrgb openrgb-udev-rules libappindicator-gtk3 microsoft-edge-dev nordvpn openrgb openrgb-udev-rules \
        rclone sshfs virt-manager wireguard-tools zsh && \
    ostree container commit

RUN chmod -R 777 /var/lib/nordvpn

COPY nordvpn /var/lib/nordvpn