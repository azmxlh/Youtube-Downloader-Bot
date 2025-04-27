# Use official lightweight Python 3.10 image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Copy all files
COPY . /app/

# Install Python dependencies
RUN pip install -r requirements.txt

# Expose port (optional, for webhook bots)
EXPOSE 8080

# Start the bot
CMD ["python", "bot.py"]
