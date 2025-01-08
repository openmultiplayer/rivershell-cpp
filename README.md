# open.mp Rivershell gamemode component
A recreation of SA-MP's Rivershell pawn script, in C++ using open.mp SDK.  
This is a simple component and good as a starting point since Rivershell is a very basic and simple gamemode

## Usage

Just drop release Rivershell.dll or Rivershell.so (depending on your operating system) in `Components` folder, and run your open.mp server.

## Required Tools

* [CMake 3.19+](https://cmake.org/)
* [Visual Studio 2019+](https://www.visualstudio.com/) (on Windows)
* Clang (on Linux)

Visual Studio needs the `Desktop development with C++` workload with the `MSVC v142`, `Windows 10 SDK`, and `C++ Clang tools for Windows` components.

## Building on Windows

```bash
mkdir build
cd build
cmake .. -A Win32 -T ClangCL
```

Open Visual Studio and build the solution.

## Building on Linux

```bash
mkdir build
cd build
# May need to configure this line.
export CC=/usr/lib/llvm/13/bin/clang CXX=/usr/lib/llvm/13/bin/clang++
cmake .. -G Ninja -DCMAKE_C_FLAGS=-m32 -DCMAKE_CXX_FLAGS=-m32 -DCMAKE_BUILD_TYPE=Debug \
cmake --build . --config Debug
```

Change `Debug` to `Release` for final versions.

## Building with Docker

```bash
cd docker
.\build.sh
```

You may need to set up some directories first:

```bash
mkdir build
sudo chown 1000 build
```

Instead you run the script as root, and target a specific distro:

```bash
UBUNTU_VERSION=18.04 sudo .\build.sh
```

The output is in `docker/build/`

