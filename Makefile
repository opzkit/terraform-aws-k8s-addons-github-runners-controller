SHELL = /bin/bash
EXAMPLES = $(shell find ./examples/* -maxdepth 1 -type d -not -path '*/\.*')

.PHONY: examples
examples: $(addprefix example/,$(EXAMPLES))

.PHONY: example/%
example/%:
	@echo "Processing example: $(notdir $*)"
	@terraform -chdir=$* init
	@terraform -chdir=$* validate
	@terraform -chdir=$* plan

helm-update:
	@helm repo add actions-runner-controller https://actions-runner-controller.github.io/actions-runner-controller
	@helm repo update actions-runner-controller

template:
		@helm template actions-runner-controller actions-runner-controller/actions-runner-controller \
			-n actions-runner-system \
			--include-crds \
			-n actions-runner-system \
			--values values.yaml >| manifests/actions-runner-controller.yaml

.PHONY: release
release: check-env
	sed 's/^  version = ".*"/  version = "$(VERSION)"/' module_version.tf

.PHONY: check-env
check-env:
ifndef VERSION
	$(error VERSION is undefined)
endif
