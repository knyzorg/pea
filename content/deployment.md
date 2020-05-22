---
title: "Deployment"
menu: 
    main:
        weight: 1
        parent: "Release"
---

The procedure to deploy the TLC system is straight-forward and standard. It includes installing dependencies, setting up a database and publishing to IIS.

# Dependencies

In order to be able to publish the system, the publishing system needs to have two dependencies installed: .NET Core SDK and NodeJS. The former is necessary to compile the application, while the latter is required to compile the JavaScript assets as part of the build process.

The deployment server needs to have IIS installed and a SQL Server database available.

# Database

A database needs to be created and setup using the migrations. To do, execute `dotnet ef database update` in the command-line. The application needs to have an IIS pool setup to authenticate with the database without using a password. The procedure for this is described in the runbook.

# Publication

The Visual Studio publication wizard needs to be followed in order to deploy the application to IIS. To open the publication wizard, right-click on the TLC project in the solution explorer and select "publish". Detailed instructions can be found in the runbook. Make sure to enable the Secure Socket Layer (SSL).

# Runbook

A detailed guide for publishing can be found in the [Runbook](/files/Runbook.docx)