FROM gfx2015/android

# FROM growerp/flutter-sdk-image

# WORKDIR /app

# COPY . .

# RUN apt update -y && apt install -y cmake

WORKDIR /test

RUN flutter create .

CMD flutter build apk
