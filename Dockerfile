FROM python:3.9-slim

WORKDIR /app

# Update and install system dependencies including those required for mysqlclient
RUN apt-get update && apt-get install -y \
    pkg-config \
    default-libmysqlclient-dev \
    gcc \
    libc-dev \
    libffi-dev\
    build-essential \
    curl \
    software-properties-common \
    git

# Clone the repository into the working directory
RUN git clone https://github.com/MaheshPrime/BookEase-Management-System.git .
COPY . /app
# Install Python dependencies from requirements.txt
RUN pip3 install -r requirements.txt

# Expose port 5000 for the application
EXPOSE 5000

# Command to run the Flask application
CMD ["flask", "run", "--host=0.0.0.0"]