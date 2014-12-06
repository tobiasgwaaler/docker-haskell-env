FROM haskell:7.8

RUN echo "deb http://http.debian.net/debian wheezy-backports main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install git -y

RUN apt-get install zsh -y
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
ADD zshrc /root/.zshrc

RUN apt-get -t wheezy-backports install "emacs24" -y

RUN cabal update 
RUN cabal install ghc-mod

# install emacs packages
ADD emacs /root/.emacs
ADD install-emacs-packages.el /root/install-emacs-packages.el
RUN emacs --script /root/install-emacs-packages.el

CMD ["zsh"]
