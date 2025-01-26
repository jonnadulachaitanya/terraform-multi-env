resource "aws_route53_record" "expense" {
    for_each = aws_instance.multienv
    records = startswith(each.key, "frontend") ? [each.value.public_ip] : [each.value.private_ip] 
    name = each.key == "frontend-prod" ? var.domain_name : "${each.key}.${var.domain_name}"
    type = "A"
    ttl = 1
    zone_id = var.zone_id
    allow_overwrite = true
}