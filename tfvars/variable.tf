variable "instances" {

}

variable "tags" {

}

variable "common_tags" {
    default = {
        project = "expense"
        terraform = "true"
    }
}

variable "zone_id" {
    default = "Z07531171JTKXQEA9NV0O"
}

variable "domain_name" {
    default = "chaitanyaproject.online"
}

variable "environment" {
    
}

