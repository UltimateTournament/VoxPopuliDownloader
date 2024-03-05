FROM python:3.8

WORKDIR /app

RUN apt update && apt install git

RUN git clone https://github.com/facebookresearch/voxpopuli.git .

COPY requirements.txt .

RUN apt install s3cmd -y

# use our requirements
RUN pip install -r requirements.txt

COPY . .

CMD [ "bash", "download.sh" ]
