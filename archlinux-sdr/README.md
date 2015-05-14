# A Archlinux SDR tools

# A SDR tools

This SDR container contains:

    - gnuradio

## How to use

### Use from command line

    XSOCK=/tmp/.X11-unix/X0
    docker run -ti --rm  -v $XSOCK:$XSOCK -v  -v /dev/bus/usb:/dev/bus/usb badele/archlinux-sdr
    $ gnuradio-companion

### Add the shorcut in the .zshrc

    export XSOCK=/tmp/.X11-unix/X0
    dk_gnuradio-companion(){
        docker run -ti --rm  -v $XSOCK:$XSOCK -v  -v /dev/bus/usb:/dev/bus/usb badele/archlinux-sdr
    }

You can now execute the gnuradio companion_dk with your host USB SDR

    $ dk_gnuradio-companion