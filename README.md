[![unlicense](https://img.shields.io/badge/un-license-green.svg?style=flat)](http://unlicense.org)
[
![docker stars](https://img.shields.io/docker/stars/Didstopia/freebsd-cross.svg?style=flat)
![docker pulls](https://img.shields.io/docker/pulls/Didstopia/freebsd-cross.svg?style=flat)
](https://hub.docker.com/r/Didstopia/freebsd-cross/)
[![docker build status](https://img.shields.io/docker/build/Didstopia/freebsd-cross.svg?style=flat)](https://hub.docker.com/r/Didstopia/freebsd-cross/builds/)
[![docker image size](https://img.shields.io/microbadger/image-size/Didstopia/freebsd-cross.svg?style=flat)](https://microbadger.com/images/Didstopia/freebsd-cross)

# docker-freebsd-cross

***NOTICE: This is a fork of [docker-freebsd-cross](https://github.com/valpackett/docker-freebsd-cross) by [valpackett](https://github.com/valpackett) and primarily adds support to target different FreeBSD versions.***

An Alpine based Docker image for cross-compiling to any version of FreeBSD (amd64) using clang.

- Allows pkg dependency installation!
- Configures pkgconf (pkg-config)!
- Configures meson! (use `--cross-file freebsd`)

## Usage

```docker
FROM didstopia/freebsd-cross:latest
RUN pkg -r /freebsd install -y \
      libepoll-shim \
      libudev-devd \
      libevdev \
      libwacom \
      gtk3 \
      libmtdev
ADD . /build
RUN cd /build && \
	  meson build --cross-file freebsd -Ddocumentation=false -Dtests=false -Depoll-dir=/freebsd/usr/local/ && \
	  ninja -Cbuild
```

## Contributing

Please feel free to submit pull requests!

By participating in this project you agree to follow the [Contributor Code of Conduct](https://www.contributor-covenant.org/version/1/4/).

[The list of contributors is available on GitHub](https://github.com/Didstopia/docker-freebsd-cross/graphs/contributors).

## License

This is free and unencumbered software released into the public domain.  
For more information, please refer to the `UNLICENSE` file or [unlicense.org](https://unlicense.org).
