
BUILDER_FILES := $(shell find builder/ -name '*.sh')

ensure_executable: $(BUILDER_FILES)
	find builder/ -name '*.sh' | xargs chmod +x

output-virtualbox-iso/alpine.ovf: template.json
	@packer build -force $<

output-virtualbox-ovf/alpine-kubernetes.ovf: kubernetes.json output-virtualbox-iso/alpine.ovf $(BUILDER_FILES) ensure_executable
	@packer build -force  $<

kubernetes: output-virtualbox-ovf/alpine-kubernetes.ovf
alpine: output-virtualbox-iso/alpine.ovf
