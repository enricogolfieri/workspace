FROM ubuntu:22.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libgl1 libglib2.0-0
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y make build-essential git libssl-dev zlib1g-dev libbz2-dev \
        libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
        xz-utils tk-dev libffi-dev liblzma-dev
RUN apt-get clean im

ENV PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_ROOT_USER_ACTION=ignore \ 
    CUDA_VISIBLE_DEVICES=0

#install pyenv
RUN curl https://pyenv.run | bash
ENV PYENV_ROOT="/root/.pyenv"
ENV PATH="${PYENV_ROOT}/bin:${PATH}"
ENV PATH="${PYENV_ROOT}/shims:${PATH}"
RUN echo 'eval "$(pyenv init --path)"' >> /root/.bashrc
RUN echo 'eval "$(pyenv init -)"' >>  /root/.bashrc
RUN echo 'eval "$(pyenv virtualenv-init -)"' >> /root/.bashrc

#add pyenv virtualenv to bashrc
RUN . /root/.bashrc && pyenv install 3.10.10
RUN . /root/.bashrc && pyenv global 3.10.10

RUN pip install instaloader
RUN git clone https://github.com/enricogolfieri/imaginAIry.git /root/imaginAIry && cd /root/imaginAIry
RUN pip install --upgrade pip pip-tools
RUN pip-sync /root/imaginAIry/requirements-dev.txt
RUN pip install -e /root/imaginAIry --no-deps
RUN pip install `pip freeze | grep "^torch=="`
WORKDIR /root/imaginAIry
RUN echo "alias load='source /root/.config/workspace/envs/base/imaginary/.aliases && echo loaded datax aliases'" >> /root/.bashrc

#ENTRYPOINT [ "/bin/bash", "-c", ". /root/.bashrc && pyenv activate imaginairy-3.10.10 && echo loaded datax aliases" ]

