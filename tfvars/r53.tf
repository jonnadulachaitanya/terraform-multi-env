resource "aws_route53_record" "expense" {

    for_each = aws_instance.expense
    name = each.key == "frontend-prod" ? var.domain_name : "${each.key}.${var.domain_name}"
    records = startswith(each.key,"frontend") ? [each.value.public_ip] : [each.value.private_ip]
    zone_id = var.zone_id
    type = "A"
    ttl = 1
    allow_overwrite = "true"

}