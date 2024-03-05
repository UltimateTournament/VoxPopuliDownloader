FROM python:3.8

WORKDIR /app

RUN apt update && apt install unzip -y

RUN git clone https://github.com/facebookresearch/voxpopuli.git .

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install

COPY requirements.txt .

# use our requirements
RUN pip install -r requirements.txt


COPY . .

CMD [ "bash", "download.sh" ]
