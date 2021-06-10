FROM ubuntu:latest

ARG BRANCH=main
ARG REPO=https://github.com/martomi/chiadog.git

ENV config_dir=/root/.chiadog/config.yaml
ENV TZ=America/Los_Angeles

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y python3 bash ca-certificates git openssl python3-pip build-essential python3-dev python3.8-venv python3.8-distutils python-is-python3 

RUN echo "Cloning chiadog"
RUN git clone --depth 1 --branch ${BRANCH} ${REPO} \
&& cd chiadog \
&& python3 -m venv venv \
&& . ./venv/bin/activate \
&& pip3 install -r requirements.txt

WORKDIR /chiadog
ADD ./entrypoint.sh entrypoint.sh

ENTRYPOINT ["bash", "./entrypoint.sh"]
