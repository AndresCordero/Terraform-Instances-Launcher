#### provider #####

provider "aws" {
    region = "us-east-1"
}

data "aws_ssm_parameter" "amzn2" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}


resource "aws_instance" "nginx-server" {
    ami = data.aws_ssm_parameter.amzn2.value
    instance_type = "t3.micro"  

  user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1 -y
sudo systemctl start nginx
sudo systemctl enable nginx
EOF
} 


