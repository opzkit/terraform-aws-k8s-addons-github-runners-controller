resource "aws_secretsmanager_secret" "secret" {
  name = "actions-runner-system"
}

resource "aws_secretsmanager_secret_version" "secret_value" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = jsonencode(local.secret_value)
}

locals {
  secret_value = {
    SSH_KEY                     = var.github_runners_system.runners.ssh_key
    BUILDTOOLS_YAML             = var.github_runners_system.runners.buildtools_content
    KNOWN_HOSTS                 = "github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg="
    APP_ID                      = var.github_runners_system.application.app_id
    INSTALLATION_ID             = var.github_runners_system.application.installation_id
    CLIENT_SECRET               = var.github_runners_system.application.client_secret
    GITHUB_WEBHOOK_SECRET_TOKEN = var.github_runners_system.webhook.secret
  }
}
