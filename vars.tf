// Create Github Client App for organization following
// https://github.com/actions-runner-controller/actions-runner-controller#deploying-using-github-app-authentication
variable "account_id" {
  type        = string
  description = "The AWS account id, to setup ECR access"
}

variable "github_runners_system" {
  type = object({
    application = object({
      app_id : string,
      installation_id : string,
      client_secret : string
    }),
    runners = object({
      cluster_role : optional(string),
      image : optional(string),
      ssh_key : string,
      buildtools_content : optional(string)
    }),
    webhook = object({
      secret : string
      host : string
    })
  })
  description = "Github Actions runner configuration"
}
