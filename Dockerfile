FROM debian:latest
RUN apt-get update -y 
RUN apt-get install -y xorg
RUN apt-get install -y \
    libxrender1 \
    libxtst6 \
    libxi6 \
    tigervnc-standalone-server \
    tigervnc-common \
    wget \
    firefox-esr 
WORKDIR /app
RUN touch /root/.Xauthority
COPY . .
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 5901
CMD ["/start.sh"]
