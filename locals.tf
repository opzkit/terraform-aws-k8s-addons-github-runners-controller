locals {
  version = "0.0.1"
  yaml = templatefile("${path.module}/arc-systems.yaml", {
    version = local.version
  })

}
