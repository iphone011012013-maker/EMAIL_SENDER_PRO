# استخدام نسخة بايثون خفيفة
FROM python:3.9-slim

# تحديد مجلد العمل داخل الحاوية
WORKDIR /app

# نسخ ملف المكتبات وتثبيتها
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# نسخ كود المشروع بالكامل
COPY . .

# الأمر الذي سيقوم بتشغيل أداة إرسال الإيميلات
CMD ["python", "EMAIL_SENDER_PRO.PY"]
