FROM ubuntu:latest

# ติดตั้ง dependencies พื้นฐาน
RUN apt-get update && \
    apt-get install -y curl zip ca-certificates gnupg wget unzip && \
    rm -rf /var/lib/apt/lists/*

# ติดตั้ง Node.js 22.x
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs

# ติดตั้ง Terraform
RUN wget https://releases.hashicorp.com/terraform/1.8.5/terraform_1.8.5_linux_amd64.zip && \
    unzip terraform_1.8.5_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_1.8.5_linux_amd64.zip

# ติดตั้ง ESLint, Jest, TypeScript, eslint-plugin-jest (dev dependencies)
RUN npm install -g eslint jest @types/jest typescript eslint-plugin-jest

# กำหนด working directory
WORKDIR /app

CMD [ "bash" ]
