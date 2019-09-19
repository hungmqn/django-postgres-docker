FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /app
WORKDIR /app
ADD ./src /app/
RUN pip install -r requirements.txt
# --no-cache-dir 


