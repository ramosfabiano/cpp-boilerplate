FROM debian:bookworm

RUN apt update
RUN apt install -y build-essential cmake clang clang-tidy clang-format libboost-all-dev lcov git wget 

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME

WORKDIR /workspace

USER $USERNAME

