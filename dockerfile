# Use the official slim Python image as a base image
FROM python:3.9-slim-buster

# Set the working directory in the container
WORKDIR /app

# Install gcc and other necessary build tools 
RUN apt-get update && apt-get install -y gcc python3-dev libpq-dev build-essential

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any dependencies specified in requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the working directory contents into the container at /app
COPY . .

#Set the environment variables for the flask app
ENV FLASK_RUN_HOST=0.0.0.0

#Expose the port on which the flask app will run
EXPOSE 5000

# Specify the command to run on container start
CMD ["flask", "run"]
