FROM centos:latest
ENV TERRAFORM_VERSION=0.15.0

#Install dependencies 
RUN yum install wget unzip -y && \
    yum update -y && \
    yum install python3 -y && \
    yum install python3-pip -y 

#Install aws-cli
RUN pip3 install awscli

# Install terraform
RUN wget "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/terraform  && \
    terraform --version
