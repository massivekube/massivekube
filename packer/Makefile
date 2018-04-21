
../output/machine-images/alpine/alpine.ovf: base/packer.json base/answers base/provision.sh
	@cd base && PACKER_CACHE_DIR=../packer_cache packer build -force packer.json

../output/machine-images/kubernetes/kubernetes.ovf: kubernetes.json ../output/machine-images/alpine/alpine.ovf
	@packer build -force  $<

kubernetes: ../output/machine-images/kubernetes/kubernetes.ovf
alpine: ../output/machine-images/alpine/alpine.ovf
