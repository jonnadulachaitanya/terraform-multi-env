variable "instances" {
    type = map 
}

variable "zone_id" {
    default = "Z07531171JTKXQEA9NV0O"
}

variable "domain_name" {
    default = "chaitanyaproject.online"
}

variable "common_tags" {
    default = {
        project = "expense" 
        terraform = "true"

    }
}

variable "tags" {
    type = map

}

variable "environment" {

}