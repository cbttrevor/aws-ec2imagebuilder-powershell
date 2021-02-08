## Error When Running New-EC2IBComponent

```
New-EC2IBComponent: The value supplied for parameter 'data' is not valid. Invalid schema version. Supported versions include: 1.0.
```

### Cause and Solution

The component YAML configuration must have the schema version defined. Currently, the only supported version is 1.0.

## Error When Running 

```
New-EC2IBComponent: The value supplied for parameter 'data' is not valid. Parsing step 'InstallNginx' in phase 'build' failed. Error: Unsupported action InvokeBash for os platform linux.
```

### Cause and Solution

Ensure that your component configuration file has references to valid action modules. `InvokeBash` is not a valid action module, but `ExecuteBash` is.
The [AWS documentation](https://docs.aws.amazon.com/imagebuilder/latest/userguide/image-builder-action-modules.html) has an authoritative list of all supported action modules.

## Error When Deleting an EC2 Image Builder Component

```
Resource dependency error: The resource ARN 'arn:aws:imagebuilder:us-west-2:665453315198:component/install-powershell-core/1.0.1/1' has other resources depended on it.
```

### Cause and Solution

Before deleting components, all references to them must be removed.
Delete any recipes that are referencing the components, and then try removing the component again.