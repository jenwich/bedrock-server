FROM ubuntu:latest

ARG APP_DIR=/bedrock-server
ARG DOWNLOAD_ZIP=https://minecraft.azureedge.net/bin-linux/bedrock-server-1.8.1.2.zip

RUN apt-get update && \
    apt-get install -y unzip curl libcurl4 libssl1.0.0 && \
    curl ${DOWNLOAD_ZIP} --output bedrock-server.zip && \
    unzip bedrock-server.zip -d ${APP_DIR} && rm bedrock-server.zip

WORKDIR ${APP_DIR}

ENV LD_LIBRARY_PATH=.

EXPOSE 19132/udp

CMD [ "./bedrock_server" ]

