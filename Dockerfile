FROM alpine:3.10

RUN apk add --no-cache python
RUN apk add --no-cache curl
RUN apk add --no-cache ffmpeg

RUN mkdir /video -p

ADD https://yt-dl.org/downloads/latest/youtube-dl /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl
COPY Config/youtube-dl.conf /etc/

CMD ["top"]