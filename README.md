# Raylib Template

A Raylib C++ template for building on MacOS (M1 Processor) and WASM.

Raylib Version: 4.2.0

## Building for MacOS 

Assuming Clang++ is installed on your system...

`make build-macos`

If your machine is using the aarch64 architecture then you will need to run the above command using Rosetta...

`arch -x86_64 make build-macos` 

## Building for Web 

Before you can build for the web, you'll need to have [emscripten](https://emscripten.org/docs/getting_started/downloads.html) installed. The `emsdk` submodule is included as part of this repo which makes it easy to install different versions of the compiler.
In the `emsdk` folder run 

`./emsdk install latest` 
`./emsdk activate latest`
`source emsdk/emsdk_env.sh` (depending on your shell)

then build with

`make build-wasm32`

To view it in the browser...

`cd web`
`python3 -m http.server 8080`

Then go to http://localhost:8080/game.html

### Possible error during compilation

At the time of writing this, I was not able to link raylib with emscripten version >3.0 due to the following warning.

```
wasm-ld: warning: function signature mismatch: time
>>> defined as (i32) -> i32 in ./lib/web/libraylib.a(core.o)
>>> defined as (i32) -> i64 in ./emscripten/3.1.20/libexec/cache/sysroot/lib/wasm32-emscripten/libc-debug.a(emscripten_time.o)
```

Even though the .wasm file is generated, you'll notice a browser error along the lines of `Uncaught RuntimeError: unreachable` and nothing load. 

To work around this, you'll need to install emscripten version 2.0.0 via the sdk via the `./emsdk install 2.0.0` command followed by the `./emsdk activate 2.0.0` command. On a Mac you may be required to run this command with Rosetta.

When emscripten 2.0.0 is setup simply run the build command again.

## Building for Windows


## Building for Linux 
