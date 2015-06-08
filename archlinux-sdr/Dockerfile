FROM badele/archlinux-mybase
MAINTAINER Bruno Adelé "bruno@adele.im"

# Install the gnuradio
RUN yaourt -Syu
RUN yaourt -S --noconfirm gnuradio gnuradio-companion ttf-liberation


# Install the SDRHunter
RUN yaourt -Syu
RUN yaourt -S --noconfirm python2-pip git
RUN yaourt -S --noconfirm gcc cmake
RUN yaourt -S --noconfirm make
RUN yaourt -S --noconfirm qt4-base
RUN yaourt -S --noconfirm qtchooser

RUN pip2 install git+git://github.com/badele/SDRHunter.git

# Clean the packages cache
RUN rm -f /var/cache/pacman/pkg/*

CMD bash