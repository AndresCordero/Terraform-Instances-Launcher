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
}



