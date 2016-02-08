$scriptpath = split-path -parent $MyInvocation.MyCommand.Path
$nugetpath = resolve-path "$scriptpath/../.nuget/nuget.exe"
$packagespath = resolve-path "$scriptpath/../build/packages"


  pushd $packagespath
  
  $key = "12345"

  # Find all the packages and display them for confirmation
  $packages = dir "*.nupkg"
  
  write-host "Packages to upload:"
  $packages | % { write-host $_.Name }

  # upload
    $packages | % { 
        $package = $_.Name

        write-host "Uploading $package to nuget.drivr.com"
        & $nugetpath push -source "http://nuget.drivr.com" $package c0036212-9942-4dac-8b0a-616c093be86f
        write-host ""
    }
popd