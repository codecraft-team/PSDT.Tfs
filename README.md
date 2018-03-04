# PSDT.Tfs

[![Build status](https://ci.appveyor.com/api/projects/status/xy4rd52lvicqxufk/branch/master?svg=true&passingText=Build%20Passing&failingText=Build%20Failing&pendingText=Build%20Pending)](https://ci.appveyor.com/project/codecraftteam/PSDT-Tfs)

A collection of PowerShell scripts and modules, which increase .NET developers every day productivity.

## Table of contents

1. [Overview](#overview)
1. [Team Foundation Server Module](#tfsmodule)

## Overview

### Requirements <a name="requirements"></a>

To use these modules the PowerShell execution policy must allow executing local scripts.
To enable executing scripts one can use e.g.

```powershell
Set-ExecutionPolicy RemoteSigned
```

To verify the current execution policy use

```powershell
Get-ExecutionPolicy
```

## TFS module: PSDT.TFS <a name="tfsmodule"></a>

Contains cmdlets to simplify working with Team Foundation Server from within the powershell.

### Prerequisites

- PSDT.VisualStudio
- PowerShell snap-in Microsoft.TeamFoundation.PowerShell which is available through the Team Foundation Server PowerTools.

### Cmdlets

All cmdlets within this module use "Tfs" as noun prefix. When the module is loaded the Microsoft.TeamFoundation.PowerShell snap-in will be loaded.
To get an overview of available cmdlets use the PowerShell Get-Command cmdlet.

```powershell
Get-Command -noun Tfs
```

#### Get-TfsLatest

Performs a get latest operation. The cmdlet must be executed from within a local workspace to work.

```powershell
Get-TfsLatest
```

For detailed list of parameters and examples see

```powershell
Get-Help Get-TfsLatest -Detailed
```