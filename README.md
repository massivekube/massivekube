# Massivekube

High security, resilient, batteries included kubernetes deployment.

## Components

The MassiveKube project is being built as a number of components in there own repositories:

- **[aports](https://github.com/massivekube/aports)** - Alpine Linux builds of the software we depend on.
- **[machine-images](https://github.com/massivekube/machine-images)** - Machine images we deploy to the cloud providers. Currently only AWS is supported.
- **[terraform](https://github.com/massivekube/terraform)** - Responsible for setting up the infrastructure to run the platform.
