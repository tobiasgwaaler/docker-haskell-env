## Usage

Install docker

```
git clone https://github.com/tobiasgwaaler/docker-haskell-env.git
cd docker-haskell-env
./go
```

This will build the container and run zsh inside it. Inside the container you'll have GHC, Cabal and other goodies installed, and the `/Users` directory on your host will be mounted at `/Users` inside the container.