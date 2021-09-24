```
docker build -t sway-builder:latest ./
```

```
docker run sway-builder:latest build wlroots tags/0.13.0
docker run sway-builder:latest build wlroots tags/0.13.0
```

```
docker run -it --entrypoint /bin/bash sway-builder:latest
```