FROM debian:10

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update

RUN apt install -y \
    wget git

# VS Code
RUN apt install -y \
    gnupg2 \
    curl \
    libnotify4 \
    libnss3 \
    libsecret-1-0 \
    libgtk-3-0 \
    libasound2 \
    libxss1 \
    libxkbfile1 \
    libx11-xcb1

RUN wget -q -O /tmp/vscode.deb https://go.microsoft.com/fwlink/\?LinkID\=760868 && \
    dpkg -i /tmp/vscode.deb && \
    rm /tmp/vscode.deb

# Language
RUN apt install -y \
    g++

ENTRYPOINT bash
