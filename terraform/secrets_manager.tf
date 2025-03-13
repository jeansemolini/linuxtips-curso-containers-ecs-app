data "aws_secretsmanager_secret" "existing_secret" {
  name = format("%s-secret-exemplo-v2", var.service_name)
}

resource "aws_secretsmanager_secret" "teste" {
  count = length(data.aws_secretsmanager_secret.existing_secret) > 0 ? 0 : 1
  name = format("%s-secret-exemplo-v2", var.service_name)
}

resource "aws_secretsmanager_secret_version" "teste" {
  secret_id     = aws_secretsmanager_secret.teste.id
  secret_string = "Vim la do secrets manager"
}