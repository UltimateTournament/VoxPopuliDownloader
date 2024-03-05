FROM python:3.8

WORKDIR /app

RUN apt update && apt install git

RUN git clone https://github.com/facebookresearch/voxpopuli.git .

COPY requirements.txt .

RUN apt install s3cmd -y

# use our requirements
RUN pip install -r requirements.txt

RUN apt install unzip -y && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install

COPY . .

CMD [ "bash", "download.sh" ]
