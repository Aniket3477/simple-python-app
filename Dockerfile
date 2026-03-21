FROM python:3.9-alpine
RUN apk update && apk upgrade # Alpine ke liye apk command
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
