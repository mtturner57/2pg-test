
# https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_dev2gp_create_pkg_ver_promote.htm
Param(
    [string]$Hub,
    [string]$Command
)

$commands = @("create", "create-version");

# Create package
function CreatePackage{
    #Gather information
    $Name = Read-Host -Prompt "What is the name of the package?";
    Write-Host "";
    $Description = Read-Host -Prompt "What is the package description?";
    Write-Host "";
    Write-Host "Is this a managed or unlocked package?";
    $Type = "0";

    while(-not($Type -eq "1" -or $Type -eq "2")){
        $Type = Read-Host -Prompt "Type 1 for managed and 2 for unlocked.";
        if(-not($Type -eq "1" -or $Type -eq "2")){
            Write-Host "Incorrect value. Please enter either 1 or 2.";
        }
        Write-Host "";
    }

    if($Type -eq "2"){
        $Namespace = "0";
        while(-not($Namespace -eq "y" -or $Namespace -eq "n")){
            $Namespace = Read-Host -Prompt "Do you want the unlocked package to use the namespace in the sfdx-project.json? y or n";
            if(-not($Namespace -eq "y" -or $Namespace -eq "n")){
                Write-Host "Incorrect value. Please enter either y or n.";
            }
            Write-Host "";
        }
    }
    $Path = Read-Host -Prompt "What is the path to the package contents?";
    Write-Host "";

    #Process information
    if($Type -eq "1"){
        $Type = "Managed";
    }
    else{
        $Type = "Unlocked"
    }

    if($Namespace -eq "y"){
        $Namespace = "";
    }
    else{
        $Namespace = "--nonamespace";
    }

    #Execute command
    Write-Host "sfdx force:package:create --description '$Description' --name '$Name' --path '$Path' --pacakgetype $Type --targetdevhubusername '$Hub' $Namespace";
    while(-not($Correct -eq "y" -or $Correct -eq "n")){
        $Correct = Read-Host -Prompt "Is this correct? y or n";
        if(-not($Correct -eq "y" -or $Correct -eq "n")){
            Write-Host "Incorrect value. Please enter either y or n.";
        }
        Write-Host "";
    }

    if($Correct -eq "y"){
       # sfdx force:package:create --description "'"$Description"'" --name "'"$Name"'" --path "'"$Path"'" --pacakgetype $Type --targetdevhubusername "'"$Hub"'" $Namespace;
    }
}

# Create package Version 
function CreatePackageVersion{
    #Gather information
    
    $Package = Read-Host -Prompt "What is the package to create a new version of?";
    $Tag = Read-Host -Prompt "What is the tag for this package version?";
    $VersionDescription = Read-Host -Prompt "What is a version description for this package version?";    
    $BoolInstallationKey;
    $InstallationKey;

    #Process Information
    
    #Execute command
    Write-Host "sfdx force:package:version:create --targetdevhubusername $Hub --package $Package --versiondescription $VersionDescription --tag $Tag --codecoverage";
}

# Report on Package that was created
function ReportPackage{

}

# List package versions
function ListPackageVersions{

}

# Install package into org
#  Need to find a way to limit this to dev and scratch maybe.
function InstallPackageVersion{

}

# Run code coverage for package
function RunCodeCoverage {

}

# Promote Package
# Upgrade the supplied pacakges minor version to get ready for the next version.
# Also create a branch that stores this version of the code for patch development.
function PromotePackage{

}

# Version Report
function ReportPackageVersion {

}

# Make a script to upgrade the stuff in the file so that we don't have to do it by hand. Might be dope.
function UpdateSfdxProject {

}

# All this function does is upgrades the supplied package's major version so that we can continue with the rest of the package process.
function UpgradeMajorVersions{

}

#Begin script processing

Write-Host "";
if([string]::IsNullOrWhiteSpace($Hub)){
    Write-Host "No dev hub alias provided. Please provide one.";
    Write-Host "Example: 2gp -Hub PFLDevHub -Command TestCommand"
    Write-Host "";
    break;
}

Switch($Command){
    "create" {
        CreatePackage; 
        break;
    }
    "create-version" {
        CreatePackageVersion;
        break;
    }
    default {
        Write-Host "";
        Write-Host "You need to list a command that is available. Here are your options:";
        foreach($str in $commands){
            Write-Host "   "$str;
        }
        Write-Host "";
        Write-Host "Example: 2gp -Hub TestHub -Command create";
        Write-Host "";
        break;
    }
}