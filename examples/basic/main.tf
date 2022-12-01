module "github_runners" {
  source = "../../"

  account_id = "123456789012"
  github_runners_system = {
    application = {
      app_id          = "appId",
      installation_id = "installationId",
      client_secret   = "clientSecret"
    },
    runners = {
      ssh_key = "-----BEGIN OPENSSH PRIVATE KEY-----",
    },
    webhook = {
      secret = "secret"
      host : "host"
    }
  }
}

output "yaml" {
  value = module.github_runners.addons
}

