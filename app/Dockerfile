FROM python:3.7.4-slim

WORKDIR /app

COPY . .

RUN python3 -m pip install -r requirements.txt

ENV FLASK_APP=api.py  

CMD ["flask", "run","--host=0.0.0.0","--port=8000"]
