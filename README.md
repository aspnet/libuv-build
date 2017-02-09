Libuv build automation 
========

This repo hosts libuv build automation for ASP.NET Core.

This project is part of ASP.NET Core. You can find samples, documentation and getting started instructions for ASP.NET Core at the [Home](https://github.com/aspnet/home) repo.

How the libuv package is built
---------

Packages for different operating systems and architectures are built from this repo, which pulls libuv code as a submodule, and pushed to the [aspnetcore-ci-dev MyGet feed](https://dotnet.myget.org/gallery/aspnetcore-ci-dev) as OS specific `Microsoft.AspNetCore.Internal.libuv-*` packages.

The [libuv-package](https://github.com/aspnet/libuv-package) repo is responsible for pulling the build packages and creating the consolidated [libuv](https://www.nuget.org/packages/Libuv/) package that contains bits for all supported architectures.

Build instructions
----------

You can build the `Microsoft.AspNetCore.Internal.libuv-*` package running `build.cmd` or `build.sh` on your machine. The build script will fetch most of the dependencies required to build.

For Linux, the OS being used for building is Ubuntu 14.04. You'll also need these dependencies:
- The dependencies of .NET Core (such as `libunwind`); see https://www.microsoft.com/net/download/core for more information
- A recent version of Mono; see http://www.mono-project.com/download/ for more information. The version of Mono that ships with Ubuntu 14.04 is too old to support the build process
- The `gcc-arm-linux-gnueabihf`, `gcc-arm-linux-gnueabi` and `gcc-aarch64-linux-gnu` packages

If you need to add support for new architectures or distributions, have a look at the `makefile.shade` file. The `libuv.so` shared library is being build there.
