SHELL = /bin/bash
EXAMPLES = $(shell find ./examples/* -maxdepth 0 -type d -not -path '*/\.*')
.PHONY: examples
examples: $(addprefix example/,$(EXAMPLES))

.PHONY: example/%
example/%:
	@echo "Processing example: $(notdir $*)"
	@terraform -chdir=$* init
	@terraform -chdir=$* validate
	@terraform -chdir=$* apply -auto-approve >$*/output
	@([[ -f $*/validate.sh ]] && $*/validate.sh $*/output) || true
