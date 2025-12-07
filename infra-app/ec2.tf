resource "aws_key_pair" "my_key" {
  key_name = "${var.env}-infra-app-key"
  public_key = file("terra-key-ec2.pub")
  tags = {
    Environment = var.env
  }
}

resource "aws_default_vpc" "default" {
  
}

resource "aws_security_group" "my_security_group" {
    name = "${var.env}-infra-app-sg"
    description = "This will add a TF generated SG"
    vpc_id = aws_default_vpc.default.id #interpolation and it means it is a way in which you can inherit or extract values from a TF block
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH open"
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTP open"
    }

    ingress {
        from_port = 8000
        to_port = 8000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Flask app"
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "all access open outbound"
    }

    tags = {
        Name = "${var.env}-infra-app-sg"
        Environment = var.env
    }
}

resource "aws_instance" "my_instance" {
    count = var.instance_count
    depends_on = [ aws_security_group.my_security_group, aws_key_pair.my_key ]
    key_name = aws_key_pair.my_key.key_name  
    security_groups = [ aws_security_group.my_security_group.name ]
    instance_type = var.instance_type
    ami = var.ec2_ami_id

    root_block_device {
      volume_size = var.env == "prd" ? 20 : 10
      volume_type = "gp3"
    }

    tags = {
        Name = "${var.env}-infra-app-ec2-instance"
        Environment = var.env
    }
}

/* resource "aws_instance" "my_new_instance" {
    ami = "unknown"
    instance_type = "unknown"
    
} */