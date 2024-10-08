# Container with ubuntu
FROM ubuntu:24.04

#####################################################################
# Install common packages
#####################################################################

# Update the package repository
RUN apt-get update

# Install basic dependencies
RUN apt-get install -y build-essential libssl-dev zlib1g-dev

#####################################################################
# Install Ruby related dependencies
#####################################################################

# Install ruby
RUN apt-get install -y ruby ruby-dev

# Install rack gem
RUN gem install rack

# Install puma gem
RUN gem install puma

# Install bundler gem
RUN gem install bundler

# Copy Gemfile and Gemfile.lock to install gems via bundler
COPY DeployTool/Gemfile /app/Gemfile
COPY DeployTool/Gemfile.lock /app/Gemfile.lock
RUN cd /app && bundle install

#####################################################################
# Install ssh client
#####################################################################

RUN apt-get install -y openssh-client

#####################################################################
# Common settings
#####################################################################

# Working directory
WORKDIR /app

# Expose the port
EXPOSE 3000
