# استخدام نسخة بايثون رسمية
FROM python:3.9-slim

# تثبيت مكتبات النظام اللازمة لتشغيل Tkinter و X11
RUN apt-get update && apt-get install -y \
    python3-tk \
    tk-dev \
    libx11-6 \
    && rm -rf /var/lib/apt/lists/*

# تحديد مجلد العمل
WORKDIR /app

# نسخ ملف المكتبات وتثبيتها
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# نسخ كود المشروع
COPY . .

# إخبار النظام باستخدام الشاشة المحلية
ENV DISPLAY=host.docker.internal:0.0

# تشغيل البرنامج
CMD ["python", "EMAIL_SENDER_PRO.PY"]
