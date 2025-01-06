resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = lookup(var.instance_type, terraform.workspace)
    vpc_security_group_ids = [aws_security_group.terraform.id]

    tags = {
        Name = "terraform-${terraform.workspace}"
    }

}

resource "aws_security_group" "terraform" {
    name = "allow-ssh" 

    egress {
        to_port = 0
        from_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        to_port = 22
        from_port =22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        default = "allow-ssh"
    }
}