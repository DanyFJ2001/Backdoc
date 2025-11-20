FROM python:3.11-slim

# Instalar poppler-utils para pdf2image
RUN apt-get update && \
    apt-get install -y poppler-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copiar archivos necesarios
COPY requirements.txt .
COPY server.py .

# Instalar dependencias Python
RUN pip install --no-cache-dir -r requirements.txt

# Exponer puerto
EXPOSE 10000

# Comando de inicio
CMD ["python", "server.py"]