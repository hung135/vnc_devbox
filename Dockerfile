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
RUN apt-get install transmission -y
# Download NetBeans installer
RUN wget https://download.netbeans.org/netbeans/8.2/final/bundles/netbeans-8.2-javase-linux.sh
# Make the installer executable
RUN chmod +x netbeans-8.2-javase-linux.sh
# Run the installer
RUN ./netbeans-8.2-javase-linux.sh
# Clean up the installer
RUN rm netbeans-8.2-javase-linux.sh

    
    
    
WORKDIR /app
RUN touch /root/.Xauthority
COPY . .
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 5901
CMD ["/start.sh"]
