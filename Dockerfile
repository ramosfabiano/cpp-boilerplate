FROM debian:bookworm

RUN apt update
RUN apt install -y build-essential cmake clang clang-tidy clang-format libboost-all-dev lcov git wget astyle

WORKDIR /app

COPY . .

#RUN cmake -Bbuild &&  make -Cbuild install
RUN make all
RUN make install
