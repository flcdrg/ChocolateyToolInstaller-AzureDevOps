# Azure DevOps task for installing Chocolatey

This is an Azure DevOps task for Azure Pipelines to install [Chocolatey](https://chocolatey.org).

Whilst Microsoft-hosted agents come with Chocolatey pre-installed, self-hosted agents may not. Including this task ensures Chocolatey
is always installed regardless of the agent type.

It was inspired in part by the [Chocolatey extension for Azure DevOps](https://github.com/chocolatey-community/chocolatey-azuredevops),
and in fact this task has since been incorporated into that extension.

See [Overview](overview.md) for installation and usage instructions.
