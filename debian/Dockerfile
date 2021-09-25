FROM debian:stable-slim

RUN apt update

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
