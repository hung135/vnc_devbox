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
################################################# install netbeans

    
    
    
WORKDIR /app
RUN touch /root/.Xauthority
COPY . .
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 5901 
ENV DISPLAY=:1

CMD ["/start.sh"]
#ENTRYPOINT ["/start.sh"]
