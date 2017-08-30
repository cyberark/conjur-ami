#!/bin/bash -ex

docker build -t ansible-boto - <Dockerfile

tty=$(tty -s && echo "-t" || true)
docker run -i ${tty} --rm \
  --env-file ansible.env \
  -v $SSH_KEY:/root/.ssh/id_rsa \
  -v $PWD:/ansible \
  -w /ansible \
  ansible-boto $@
