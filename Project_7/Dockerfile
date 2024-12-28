# Use an official Ubuntu image as a base
FROM ubuntu:20.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Copy jar file
COPY jenkins-cli.jar /home/jenkins-cli.jar

# Install Python, Java JDK 17, and necessary tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gnupg software-properties-common \
    sudo \
    wget \
    sshpass \
    python3-pip \
    openjdk-17-jdk \
    curl \
    gnupg \
    git \
    lsb-release \
    unzip \
    lftp \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

# Install Terraform
RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list
RUN sudo apt update
RUN sudo apt-get install terraform

# Install AWS CLI
RUN pip3 install awscli

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install Google Cloud SDK
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
    apt-get update -y && apt-get install google-cloud-sdk -y

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Set up environment variables for Java
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

# Verify installations
RUN echo "Verifying Java installation" && java -version
RUN echo "Verifying Python installation" && python3 --version
RUN echo "Verifying AWS CLI installation" && aws --version
RUN echo "Verifying Azure CLI installation" && az --version
RUN echo "Verifying Google Cloud SDK installation" && gcloud --version
RUN echo "Verifying sshpass installation" && sshpass -V
RUN echo "Verifying kubectl installation" && kubectl version --client

# Your application's default command
CMD ["/bin/bash"]
