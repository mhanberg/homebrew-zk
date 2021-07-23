# zk tap for brew

This is a custom homebrew tap for [zk](https://github.com/mickael-menu/zk).

Currently, this only generates bottles for macOS Catalina and x86-64 Linux. macOS Big Sur runners for GitHub Actions will be available soon, and I'll update this to include arm64 bottles for both Mac and Linux.

## Install bottle (pre-compiled build)

```shell
$ brew tap mhanberg/zk
$ brew install zk

# or

$ brew install mhanberg/zk/zk
```

## Install from source

```shell
$ brew install --build-from-source zk
```
