FROM debian:buster

WORKDIR /app

RUN apt update -y

RUN apt install -y python3 ffmpeg libavcodec-extra atomicparsley jq parallel tree rename bc

COPY rcrack /app/rcrack

COPY getbit.py /app/getbit.py

COPY start.sh /app/start.sh

COPY drmfreeaudible.sh /app/drmfreeaudible.sh

RUN chmod +x /app/start.sh /app/getbit.py /app/drmfreeaudible.sh

ENTRYPOINT ["/app/start.sh"]