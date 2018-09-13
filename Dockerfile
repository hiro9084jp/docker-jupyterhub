ARG JUPYTERHUB_VER=1.0
FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y curl python3 npm nodejs python3-pip

RUN npm install -g configurable-http-proxy
RUN pip3 install jupyterhub
RUN pip3 install --upgrade notebook

RUN useradd --password example testuser

RUN mkdir /home/testuser && \
    chown testuser /home/testuser 

EXPOSE 8888
CMD [ "jupyterhub" "--port" "8888"]
