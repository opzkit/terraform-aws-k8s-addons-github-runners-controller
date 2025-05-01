output "addons" {
  value = [
    {
      content = local.yaml
      version = local.version
      name    = "github-runners"
    }
  ]
}

# output "permissions" {
#   value = {
#     name      = "github-runners"
#     namespace = "actions-runner-system"
#
#     aws = {
#       inline_policy = jsonencode([
#         {
#           Effect : "Allow",
#           Action : [
#             "ecr:ListTagsForResource",
#             "ecr:UploadLayerPart",
#             "ecr:ListImages",
#             "ecr:CompleteLayerUpload",
#             "ecr:TagResource",
#             "ecr:DescribeRepositories",
#             "ecr:BatchCheckLayerAvailability",
#             "ecr:ReplicateImage",
#             "ecr:CreateRepository",
#             "ecr:PutImage",
#             "ecr:BatchGetImage",
#             "ecr:DescribeImages",
#             "ecr:InitiateLayerUpload",
#             "ecr:PutLifecyclePolicy",
#             "ecr:GetDownloadUrlForLayer"
#           ],
#           Resource : [
#             "arn:aws:ecr:*:${var.account_id}:repository/*"
#           ]
#         },
#         {
#           Effect : "Allow",
#           Action : [
#             "ecr:GetAuthorizationToken"
#           ],
#           Resource : [
#             "*"
#           ]
#         }
#       ])
#     }
#   }
# }
