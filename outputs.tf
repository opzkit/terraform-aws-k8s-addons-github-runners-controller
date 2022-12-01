output "addons" {
  value = [
    {
      name    = "actions-runner-system-secrets"
      content = file("${path.module}/manifests/secrets.yaml")
      version = local.version
    },
    {
      name = "actions-runner-system-controller"
      content = join("---\n",
        [
          file("${path.module}/manifests/namespace.yaml"),
          templatefile("${path.module}/manifests/actions-runner-controller.yaml",
            {
              "webhook_host" : var.github_runners_system.webhook.host,
            }
          )
        ]
      )
      version = local.version
    },
    {
      name    = "actions-runner-system-runners"
      content = file("${path.module}/manifests/runners.yaml")
      version = local.version
    }
  ]
}

output "permissions" {
  value = {
    name      = "github-runners"
    namespace = "actions-runner-system"

    aws = {
      inline_policy = jsonencode([
        {
          Effect : "Allow",
          Action : [
            "ecr:ListTagsForResource",
            "ecr:UploadLayerPart",
            "ecr:ListImages",
            "ecr:CompleteLayerUpload",
            "ecr:TagResource",
            "ecr:DescribeRepositories",
            "ecr:BatchCheckLayerAvailability",
            "ecr:ReplicateImage",
            "ecr:CreateRepository",
            "ecr:PutImage",
            "ecr:BatchGetImage",
            "ecr:DescribeImages",
            "ecr:InitiateLayerUpload",
            "ecr:PutLifecyclePolicy",
            "ecr:GetDownloadUrlForLayer"
          ],
          Resource : [
            "arn:aws:ecr:*:${var.account_id}:repository/*"
          ]
        },
        {
          Effect : "Allow",
          Action : [
            "ecr:GetAuthorizationToken"
          ],
          Resource : [
            "*"
          ]
        }
      ])
    }
  }
}
