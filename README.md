## Usage

```
alias _haskellenv='cd /Users/tobiasgw/src/docker-haskell-env && ./go'
alias _dockerboot='boot2docker init && boot2docker start && $(boot2docker shellinit)'
alias haskellenv='dockerboot && haskellenv'
```

Once you're inside the the container, your `/Users` directory will be mounted at `/Users`