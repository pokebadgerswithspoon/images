 # protoc-gen-validate 

https://github.com/envoyproxy/protoc-gen-validate

binaries behind the tool packed as Docker image

## Usage

```sh
docker run ghcr.io/pokebadgerswithspoon/images/protoc-gen-validate:latest
```

Or make an alias

```sh
alias protoc-gen-validate='docker run ghcr.io/pokebadgerswithspoon/images/protoc-gen-validate:latest'
```

Or make a script

`/usr/local/bin/protoc-gen-validate`
```sh
#!/bin/sh
docker run ghcr.io/pokebadgerswithspoon/images/protoc-gen-validate:latest
```