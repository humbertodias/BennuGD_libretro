FROM devkitpro/devkita64:20250728
RUN useradd -ms /bin/bash containeruser

USER root
RUN echo "containeruser:containeruser" | chpasswd \
 && usermod -aG sudo containeruser

ADD build-nro.sh /usr/local/bin/build-nro.sh
RUN chmod +x /usr/local/bin/build-nro.sh

USER containeruser

