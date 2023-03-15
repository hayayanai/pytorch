FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y
RUN apt-get autoremove -y
RUN apt-get autoclean -y

RUN apt-get install -y gnupg2 curl
RUN apt-get install -y software-properties-common tzdata
ENV TZ=Asia/Tokyo
RUN add-apt-repository ppa:deadsnakes/ppa

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN apt-get update -y
RUN apt-get install python3.11 -y
RUN apt-get install python3.11-dev -y
RUN apt-get install python3.11-tk -y

RUN apt-get remove python-pip
RUN apt-get -y install python3.11-distutils
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11
RUN python3.11 -m pip --version

RUN python3.11 -m pip install -U setuptools==65.5.0
RUN python3.11 -m pip install -U pip wheel stable-baselines3 python-dotenv torch-tb-profiler
RUN python3.11 -m pip install --pre torch --extra-index-url https://download.pytorch.org/whl/nightly/cu118
