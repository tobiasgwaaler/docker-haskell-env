## Usage

```
alias _haskellenv='cd /Path/to/docker-haskell-env && ./go'
alias _dockerboot='boot2docker init && boot2docker start && $(boot2docker shellinit)'
alias haskellenv='_dockerboot && _haskellenv'
```

Once you're inside the the container, your `/Users` directory will be mounted at `/Users`