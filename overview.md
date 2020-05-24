# Azure DevOps task for installing Chocolatey

This is an Azure DevOps task for Azure Pipelines to install [Chocolatey](https://chocolatey.org).

Whilst Microsoft-hosted agents come with Chocolatey preinstalled, self-hosted agents may not. Including this task ensures Chocolatey
is always installed regardless of the agent type.

It was inspired in part by the [Chocolatey extension for Azure DevOps](https://github.com/chocolatey-community/chocolatey-azuredevops),
and is a complimentary in that the one thing that task doesn't handle is installation.

## Installation

1. Add the extension to your Azure DevOps organisation.

2. Add the task to an Azure Pipelines pipeline

Example:

```yaml
trigger:

- master

pool:
  vmImage: 'windows-latest'

steps:
- task: ChocolateyToolInstaller@1
  inputs:
    force: false
```

### Parameters

**force** - When set to true, forces Chocolatey installation regardless of whether `choco.exe` is found already on the machine.

## Notes

Chocolatey may take a few minutes to install on Microsoft-hosted agents. Up to 4 minutes has been observed. This seems to be just a Chocolatey thing - not specific to this task.
