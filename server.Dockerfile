# Base image Ubuntu
FROM ubuntu:24.04

# Install SSH server and other required packages
RUN apt-get update

RUN apt-get install -y build-essential

##################################################
# Set root password | User: root, Password: (empty, no need to type anything)
##################################################

# Uncomment the following line to set the `root` password
# RUN echo 'root:root' | chpasswd

# Remove the password for the `root` account
RUN passwd -d root

##################################################
# SSH server and settings
##################################################

# Install SSH server and other required packages
RUN apt-get install -y openssh-server iproute2

# Create a directory for the SSH daemon
RUN mkdir /var/run/sshd

# Allow root login via SSH with password
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config

##################################################
# Install Ruby, Gems, Rack, and Puma
##################################################

# Install basic dependencies
RUN apt-get install -y libssl-dev zlib1g-dev

# Install ruby
RUN apt-get install -y ruby ruby-dev

# Install rack gem
RUN gem install rack

# Install puma gem
RUN gem install puma

##################################################
# Common settings
##################################################

# Start the SSH daemon
CMD ["/usr/sbin/sshd", "-D"]
