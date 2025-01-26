resource "aws_instance" "workspace" {
    instance_type = lookup(var.instance, terraform.workspace)
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]

    tags = {
        Name = "workspaces-${terraform.workspace}"
    }
}

resource "aws_security_group" "allow-ssh" {
    egress {
        to_port = 0
        from_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]

    }

    ingress {
        to_port = 22
        from_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        
    }

    tags = {
        Name = "allow-ssh"
    }
}