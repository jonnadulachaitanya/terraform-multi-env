variable "instance" {
    default = {
        prod = "t3.micro"
        dev = "t3.medium"
        qa = "t3.small"
    }
}