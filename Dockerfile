FROM python:3.9
WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir -r requirements.txt
ENV ENVIRONMENT=production
CMD ["python3", "app.py"] 
