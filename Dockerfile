# Use an official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \         # needed for pip install from GitHub
    ffmpeg \      # needed for your app
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy project files into the container
COPY . /app/

# Upgrade pip
RUN pip install --upgrade pip

# Install Python dependencies
RUN pip install -r requirements.txt

# (Optional) Expose a port if needed, e.g., for a web server
# EXPOSE 8000

# Define default command
# CMD ["python", "your_main_script.py"]
