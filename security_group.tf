
# Creating a new security group for public subnet 
resource "aws_security_group" "SG_public_subnet" {
  name        = "WordPress_security_group"
  description = "Allow SSH and HTTP"
  vpc_id      =  aws_vpc.my_vpc.id                   

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Creating a new security group for private subnet 
resource "aws_security_group" "SG_private_subnet_" {
  name        = "MYSQL_security_group"
  description = "MYSQL"
  vpc_id      =  aws_vpc.my_vpc.id                   

  ingress {
    description = "MYSQL Port"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}