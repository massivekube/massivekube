High security, resilient, batteries included kubernetes deployment.

## Components

The MassiveKube project is being built as a number of components in there own repositories:

- **[aports](https://github.com/massivekube/aports)** - Alpine Linux builds of the software we depend on.
- **[machine-images](https://github.com/massivekube/machine-images)** - Machine images we deploy to the cloud providers. Currently only AWS is supported.
- **[terraform](https://github.com/massivekube/terraform)** - Responsible for setting up the infrastructure to run the platform.

## Implementation Plan

### Stage 0 - AWS Infra

- [x] Setup VPC
- [x] Public/Private subnet separation
- [x] Route53 Zone
- [ ] Bastion AMI
- [ ] Bastion AWS Config

### Stage 1 - Control Plane

- [ ] Setup Controller AutoScaling Group
- [ ] Lockdown Controller SG
- [ ] Setup A-Record/DNS-SD Lambda for etcd cluster discovery
- [ ] Setup serverlessl for etcd
- [ ] Add etcd to Controller AMI
- [ ] Add headstart to Controller AMI
- [ ] Configure controller `user-data` to include etcd config
- [ ] ???

### Stage 2 - Worker Nodes

- [ ] Setup Node AutoScaling Group
- [ ] Lockdown Node SG
- [ ] ???
