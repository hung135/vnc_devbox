FROM debian:latest

RUN apt-get update -y \
    && apt-get install -y \
        xorg 
RUN apt-get install -y \
        libxrender1 \
        libxtst6 \
        libxi6 \
        tigervnc-standalone-server \
        tigervnc-common \
        wget \
        vim \
        unzip \
        firefox-esr \
        openjdk-11-jdk \
        git \
        gpg \
        apt-transport-https \
        sudo \
        transmission \
    && useradd -ms /bin/bash dockeruser \
    && echo "dockeruser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER dockeruser

##### Install NetBeans #####

WORKDIR /home/dockeruser/

RUN wget -O netbeans.zip https://dlcdn.apache.org/netbeans/netbeans/17/netbeans-17-bin.zip \
    && unzip netbeans.zip \
    && rm netbeans.zip \
    && chmod +x netbeans/bin/netbeans

RUN sudo chown -R dockeruser:dockeruser /home/dockeruser/netbeans \
    && sudo chmod -R 755 /home/dockeruser/netbeans


##### Install OpenJFX #####

RUN wget -O openjfx.zip https://download2.gluonhq.com/openjfx/19.0.2.1/openjfx-19.0.2.1_linux-x64_bin-sdk.zip \
    && unzip -q openjfx.zip \
    && mv javafx-sdk-19.0.2.1 /home/dockeruser/javafx \
    && rm openjfx.zip

##### Install Visual Studio Code #####

RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg \
    && sudo install -D -o dockeruser -g dockeruser -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
    && sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /home/dockeruser/vscode.list' \
    && sudo mv /home/dockeruser/vscode.list /etc/apt/sources.list.d/vscode.list \
    && sudo apt-get update -y \
    && sudo apt-get install -y code


WORKDIR /home/dockeruser
RUN mkdir -p /home/dockeruser/Desktop/
COPY start.sh /start.sh
RUN sudo chmod +x /start.sh
COPY start-menu.sh /start-menu.sh
RUN sudo chmod +x /start-menu.sh

EXPOSE 5901 
ENV DISPLAY=:1
CMD ["/start.sh"]
