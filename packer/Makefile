
../output/machine-images/alpine/alpine.ovf: base/packer.json base/answers base/provision.sh
	@cd base && PACKER_CACHE_DIR=../packer_cache packer build -force packer.json

../output/machine-images/kubernetes/kubernetes.ovf: kubernetes/packer.json ../output/machine-images/alpine/alpine.ovf
	@cd kubernetes && PACKER_CACHE_DIR=../packer_cache packer build -force packer.json

kubernetes: ../output/machine-images/kubernetes/kubernetes.ovf
alpine: ../output/machine-images/alpine/alpine.ovf
