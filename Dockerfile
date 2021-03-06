FROM haskell:7.8

RUN echo "deb http://http.debian.net/debian wheezy-backports main" >> /etc/apt/sources.list
RUN apt-get install git zsh -y
RUN apt-get update
RUN apt-get -t wheezy-backports install "emacs24" -y
RUN cabal update && cabal install stylish-haskell ghcid
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
ADD zshrc /root/.zshrc

CMD ["zsh"]