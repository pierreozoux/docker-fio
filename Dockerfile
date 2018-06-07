FROM debian
RUN apt-get update && apt-get install -y \
      fio \
      iperf \
      jq \
 && apt-get remove -y --purge \
 && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . .
CMD /app/run.sh
