FROM python:latest

RUN pip install requests html5lib psutil && \
    useradd --create-home --home-dir /home/gogdownloader gogdownloader

USER gogdownloader
WORKDIR /home/gogdownloader
RUN curl https://raw.githubusercontent.com/Kalanyr/gogrepoc/refs/heads/main/gogrepoc.py -o gogrepoc.py
