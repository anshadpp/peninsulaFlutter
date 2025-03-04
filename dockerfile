FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
  curl \
  git \
  unzip \
  xz-utils \
  libglu1-mesa

# Clone Flutter and check out the stable branch
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter && \
    cd /usr/local/flutter && \
    git checkout stable && \
    flutter channel stable && \
    flutter upgrade

# Set environment variables
ENV FLUTTER_ROOT=/usr/local/flutter
ENV PATH="$FLUTTER_ROOT/bin:$PATH"

# Pre-cache Flutter artifacts (optional but speeds up later commands)
RUN flutter precache

WORKDIR /app

CMD ["bash"]
