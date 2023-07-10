FROM python:3.10.6-slim

RUN apt-get update && apt-get install -y libgl1 libglib2.0-0 gcc git

ENV PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_ROOT_USER_ACTION=ignore \ 
    CUDA_VISIBLE_DEVICES=0

RUN pip install instaloader
RUN git clone https://github.com/enricogolfieri/imaginAIry.git && cd imaginAIry
RUN pip install .
RUN imagine --help

RUN echo "alias load='source /root/.config/workspace/envs/imaginary/.aliases && echo imaginary environment activated'" >> /root/.bashrc
