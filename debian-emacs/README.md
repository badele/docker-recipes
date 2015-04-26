# A emacs docker running in X11 & can edit a host files

This emacs container, can edit a files from a host directory. This emacs version contains :
  - git manager (magit)
  - auto-complete
  - yasnippet
  - Python dev environement
    - flymake
    - rope
    - pep8
  - nxhtml
  - color-theme & solarized
  - grapviz-dot-mode
  - pkgbuild-mode (for archlinux)
  - smex (most frequently history commande, IDO extenssion)
  - projectile (files project interaction)

**Note**: you can edit .emacs.el for adding or removing a plugins
 
## How to use

### Installation:

When Emacs is launched for the first time, it install the plugins, this may take time.

    XSOCK=/tmp/.X11-unix/X0
    docker run -ti --rm  -v $XSOCK:$XSOCK -v /docker_shared/debian-emacs/root/.emacs.d:/root/.emacs.d  emacs 

### Test edit file

    docker run -ti --rm  -v $XSOCK:$XSOCK -v /docker_shared/debian-emacs/root/.emacs.d:/root/.emacs.d  -v `pwd`:/files emacs emacs /files

### Add the shorcut in the .zshrc

    export XSOCK=/tmp/.X11-unix/X0
    ed(){
        docker run -ti --rm  -v $XSOCK:$XSOCK -v /docker_shared/debian-emacs/root/.emacs.d:/root/.emacs.d  -v `pwd`:/files emacs emacs /files
    }

You can now edit a host files from a emacs container

    cd directory file location
    ed
