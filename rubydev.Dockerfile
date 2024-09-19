# Container with ubuntu
FROM ubuntu:24.04

# Update the package repository
RUN apt-get update

# Install basic dependencies
RUN apt-get install -y build-essential libssl-dev zlib1g-dev

# Install ruby
RUN apt-get install -y ruby ruby-dev

# Install rack gem
RUN gem install rack

# Install puma gem
RUN gem install puma

# Working directory
WORKDIR /app

# Expose the port
EXPOSE 3000
