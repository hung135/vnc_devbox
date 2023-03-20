FROM debian:latest
RUN apt-get update -y 
RUN apt-get install -y xorg
RUN apt-get install -y \
    libxrender1 \
    libxtst6 \
    libxi6 \
    tigervnc-standalone-server \
    tigervnc-common \
    wget vim unzip \
    firefox-esr 
    
################################################# install netbeans
RUN apt-get update -y \ 
    && wget -O netbeans.zip https://dlcdn.apache.org/netbeans/netbeans/17/netbeans-17-bin.zip \
    && unzip netbeans.zip \
    && rm netbeans.zip \
    && chmod +x netbeans/bin/netbeans \
    && mv netbeans /opt/
ENV PATH="/opt/netbeans/bin:${PATH}"
RUN echo 'export PATH="/opt/netbeans/bin:${PATH}"' >> ~/.bashrc

RUN apt-get install -y openjdk-11-jdk
RUN wget -O openjfx.zip https://download2.gluonhq.com/openjfx/19.0.2.1/openjfx-19.0.2.1_linux-x64_bin-sdk.zip && \
    unzip -q openjfx.zip && \
    mv javafx-sdk-19.0.2.1 /opt/javafx && \
    rm openjfx.zip

################################################# install netbeans

RUN apt-get install git -y
########################################## install vscode
RUN apt-get install  gpg -y
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
RUN install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
RUN rm -f packages.microsoft.gpg
RUN apt install apt-transport-https -y
RUN apt update -y
RUN apt install code -y # or code-insiders

##################################################
    
WORKDIR /app
RUN touch /root/.Xauthority
COPY . .
COPY start.sh /start.sh
RUN chmod +x /start.sh
# Copy the start-menu.sh script to the container
COPY start-menu.sh /
RUN chmod +x /start-menu.sh

EXPOSE 5901 
ENV DISPLAY=:1

CMD ["/start.sh"]
#ENTRYPOINT ["/start.sh"]
