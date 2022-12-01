# terraform-aws-k8s-github-runners

A terraform module which provides
the [Github Action Runner controller](https://github.com/actions-runner-controller/actions-runner-controller)

## How to update the module to a new version of the action runners controller

```shell
helm repo add actions-runner-controller https://actions-runner-controller.github.io/actions-runner-controller
helm repo update actions-runner-controller
```

Then template the chart to file
```shell
helm template actions-runner-controller actions-runner-controller/actions-runner-controller \
  -n actions-runner-system \
  --include-crds \
  -n actions-runner-system \
  --values values.yaml >| manifests/actions-runner-controller.yaml
```

Check the changes and if everything looks correct, commit, push and PR.

## Releasing
Make sure to update the `version` (in `module_version.tf`) for the addon to match the planned tag/release version before
tagging the commit.

...or use the targets in the `Makefile`
