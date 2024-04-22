# Project description

This is a simple test of PerfBullets addon for Godot Engine. It is a simple project that uses the addon to create a simple bullet system.

## How to use

1. After cloning the repository, run the following commands in the project root directory to initialize the submodules and create junctions to the addons directory:
```posh
git submodule update --init
.\create_links.ps1
```
2. Open the project in Godot Engine.

## Building for web 

This currently only works in Chrome. To build for web, follow these steps:

1. Install emscripten and other [prerequisites](https://docs.godotengine.org/en/stable/contributing/development/compiling/compiling_for_web.html#compiling-for-the-web). Only emscripten version 3.1.28 works according to [this comment](https://github.com/godotengine/godot/issues/82865#issuecomment-1753716145)
2. Build godot web export template with the command `scons platform=web dlink_enabled=yes production=yes target=template_debug`
3. Build the gdextension with the command `scons platform=web target=release_debug`
