[![unlicense](https://img.shields.io/badge/un-license-green.svg?style=flat)](http://unlicense.org)

# docker-freebsd-cross

***NOTICE: From the original [docker-freebsd-cross](https://github.com/valpackett/docker-freebsd-cross)
by [valpackett](https://github.com/valpackett), which was enhanced by
[Didstopia](https://github.com/Didstopia/docker-freebsd-cross), then further enhanced by
[dsk799](https://github.com/dsk799/docker-freebsd-cross) which this fork is based on.***

This fork primarily adds support to target different FreeBSD versions (default FreeBSD `14.2-RELEASE`)
and architectures (default `x86_64` and/or `aarch64`).

----

An Alpine-based Docker image for cross-compiling to any version of FreeBSD (amd64/arm64) using `clang`.

- C/C++ cross-compilers are available via the `CLANG` and `CPPLANG` env variables
- Allows `pkg` dependency installation!
- Configures `pkgconf` (`pkg-config`)!
- Configures `meson`! (use `--cross-file freebsd`)
- GTK3 & GTK4 libraries for FreeBSD are installed in the image
- OpenJDK 21 for FreeBSD is also installed in the image, and is available via the `FREEBSD_JAVA_HOME` env variable.

## Usage

### `meson` cross build, for default `x86_64` architecture
To build the image for default `x86_64` architecture, on a Linux/x86_64 box:
```docker
docker build -t "freebsd-cross-x86_64" .
```
And run a `meson` cross build to FreeBSD/x86_64:
```docker
docker run --rm --volume $(pwd):/workdir -it "freebsd-cross-x86_64" /bin/sh -c \
'pkg install -y \
    libepoll-shim \
    libudev-devd \
    libevdev \
    libwacom \
    libmtdev && \
meson build --cross-file freebsd -Ddocumentation=false -Dtests=false -Depoll-dir=/freebsd/usr/local/ && \
ninja -Cbuild'
```

### `meson` cross build, for `aarch64` architecture
To build the image for `aarch64` architecture, on a Linux/aarch64 box:
```docker
docker build -t "freebsd-cross-aarch64" \
    --build-arg FREEBSD_TARGET=arm64 \
    --build-arg FREEBSD_TARGET_ARCH=aarch64 \
    --build-arg CLANG_TARGET_ARCH=aarch64 .
```
And run a `meson` cross build to FreeBSD/aarch64:
```docker
docker run --rm --volume $(pwd):/workdir -it "freebsd-cross-aarch64" /bin/sh -c \
'pkg install -y \
    libepoll-shim \
    libudev-devd \
    libevdev \
    libwacom \
    libmtdev && \
meson build --cross-file freebsd -Ddocumentation=false -Dtests=false -Depoll-dir=/freebsd/usr/local/ && \
ninja -Cbuild'
```

## Contributing

Please feel free to submit pull requests!

By participating in this project you agree to follow the [Contributor Code of Conduct](https://www.contributor-covenant.org/version/1/4/).

[The list of contributors is available on GitHub](https://github.com/chirontt/docker-freebsd-cross/graphs/contributors).

## License

This is free and unencumbered software released into the public domain.  
For more information, please refer to the `UNLICENSE` file or [unlicense.org](https://unlicense.org).
