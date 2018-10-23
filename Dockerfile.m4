FROM swift:SWIFT_VERSION

LABEL maintainer "Danielle Tomlinson <dani@tomlinson.io>"

ARG SWIFTLINT_REVISION

ENV LINT_WORK_DIR "/swiftlint"

RUN git clone https://github.com/realm/SwiftLint.git
WORKDIR "SwiftLint"

RUN git reset --hard "${SWIFTLINT_REVISION}"
RUN git submodule update --init --recursive; make install
RUN cd ../ && rm -rf SwiftLint

# RUN swiftlint version

VOLUME "${LINT_WORK_DIR}"
WORKDIR "${LINT_WORK_DIR}"

ENTRYPOINT ["swiftlint"]
