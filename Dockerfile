FROM python:3.7-stretch
LABEL MAINTANER CR <crkarthik11@gmil.com>
RUN curl -sSL https://get.docker.com/ | sh

# Install git
RUN apt-get update && \
    apt-get upgrade -y  && \
    apt-get install git -y

# Install Helm
RUN curl -s https://storage.googleapis.com/kubernetes-helm/helm-v2.9.1-linux-amd64.tar.gz | tar xzvf - -C /tmp && \
mv /tmp/linux-amd64/helm /usr/local/sbin/helm && rm -rf /tmp/linux-amd64/

ADD requirements.txt .
# Install from the requirements.txt we copied above
RUN pip install -r requirements.txt
