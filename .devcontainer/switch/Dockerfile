FROM devkitpro/devkita64:20250728
RUN useradd -ms /bin/bash containeruser

USER root
RUN echo "containeruser:containeruser" | chpasswd \
 && usermod -aG sudo containeruser

USER containeruser

# Usage inside the container:
# .devcontainer/switch/build-nro.sh
