resource "aws_instance" "multi-env" {

    for_each = var.instances

    instance_type = each.value
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.multienv-sg.id]

    tags = merge(
       var.common_tags,
       var.tags,
       {
        Name = each.key
       }
    )
}

resource "aws_security_group" "multienv-sg" {

    ingress {
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

    tags = merge(
       var.common_tags,
       var.tags,
       {
        Name = "allow-ssh.${var.environment}"
       }
    )
}

