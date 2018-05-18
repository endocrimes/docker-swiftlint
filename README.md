# docker-swiftlint

A Docker image for running [swiftlint](https://github.com/realm/swiftlint).

Variables:

* `SWIFTLINT_REVISION` can be any commit or tagged release of [SwiftLint](https://github.com/realm/SwiftLint)
* `SWIFT_VERSION` can be any tagged release of the [Swift Docker image](https://hub.docker.com/_/swift/)

## Building an image

`SWIFTLINT_REVISION="0.25.1" SWIFT_VERSION="4.1" make build`

## Releasing a swiftlint version

`SWIFTLINT_REVISION="0.25.1" SWIFT_VERSION="4.1" make release`

To push to an org that is not `dantoml`, you can also set `ORG_NAME`.

## Running swiftlint on a folder

`docker run --volume /full/path/to/folder:/swiftlint dantoml/swiftlint:0.25.1 lint`

## Running swiftlint on `stdin`

`→ echo "let i = 0" | docker run dantoml/swiftlint:0.25.1 lint --use-stdin`
```
Done linting! Found 1 violation, 0 serious in 1 file.
<nopath>:1: warning: Trailing Newline Violation: Files should have a single trailing newline. (trailing_newline)
```
