FROM debian
VOLUME /test
RUN apt-get update && apt-get install -y \
      fio \
      iperf \
      jq \
      lshw \
 && apt-get remove -y --purge \
 && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . .
CMD /app/run.sh
