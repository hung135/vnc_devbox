FROM debian:latest

RUN apt-get update -y \
    && apt-get install -y \
        xorg \
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
    && sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' \
    && sudo apt-get update -y \
    && sudo apt-get install -y code

RUN sudo chown -R dockeruser:dockeruser /home/dockeruser/.vnc \
    && sudo chmod 755 /home/dockeruser/.vnc \
    && sudo chmod 600 /home/dockeruser/.vnc/passwd \
    && sudo chmod 755 /tmp/.X11-unix \
    && sudo chown -R dockeruser:dockeruser /home/dockeruser/app



WORKDIR /home/dockeruser/app
COPY . .
COPY start.sh /home/dockeruser/start.sh
RUN sudo chmod +x /home/dockeruser/start.sh
COPY start-menu.sh /home/dockeruser/start-menu.sh
RUN sudo chmod +x /home/dockeruser/start-menu.sh

EXPOSE 5901 
ENV DISPLAY=:1
CMD ["/home/dockeruser/start.sh"]
