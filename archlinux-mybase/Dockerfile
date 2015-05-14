FROM base/archlinux
MAINTAINER Bruno Adelé "bruno@adele.im"

# Add yaourt packages repository
ADD pacman.conf /etc/pacman.conf

# Upgrade the packages
RUN pacman-key --init
RUN pacman-key --populate archlinux
RUN pacman-key --refresh-keys
RUN pacman --noconfirm -Syyu

# Install yaourt
RUN pacman-db-upgrade
RUN pacman --noconfirm -S yaourt rsync

CMD bash