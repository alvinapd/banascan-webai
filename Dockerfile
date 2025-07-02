# Gunakan image Python yang ringan
FROM python:3.10-slim

# Buat folder kerja
WORKDIR /app

# Copy file requirements dan install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy semua file project ke container
COPY . .

# Tentukan environment variable port (Fly.io pakai 8080)
ENV PORT=8080

# Perintah saat container dijalankan
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
