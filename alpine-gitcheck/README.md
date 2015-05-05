# A gitcheck docker container

From the host, you can use this command

    $ docker run --rm -v `pwd`:/files:ro badele/alpine-gitcheck

or 

    $ docker run --rm -v `pwd`:/files:ro badele/alpine-gitcheck sh -c "cd /files && gitcheck OPTIONS"

You can also create a shell function, exemple for ZSH

    gitcheck (){
        docker run --rm -v `pwd`:/files:ro badele/alpine-gitcheck
    }
    #
    $ gitcheck
