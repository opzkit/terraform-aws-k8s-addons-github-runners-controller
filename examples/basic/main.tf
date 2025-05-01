module "github_runners" {
  source = "../../"
}

output "yaml" {
  value = module.github_runners.addons
}
