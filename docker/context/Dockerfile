FROM rust:1.82.0 AS base
ARG USER_ID
ARG USER_NAME
ARG GROUP_ID
ARG GROUP_NAME
RUN addgroup --gid=${GROUP_ID} ${GROUP_NAME}
RUN adduser --uid=${USER_ID} --gid=${GROUP_ID} ${USER_NAME}

FROM base AS git-cliff
ARG VERSION
RUN cargo install "git-cliff@${VERSION}"
ENTRYPOINT ["/usr/local/cargo/bin/git-cliff"]

FROM base AS typst
ARG VERSION
RUN cargo install "typst-cli@${VERSION}"
ENTRYPOINT ["/usr/local/cargo/bin/typst"]

FROM base AS hayagriva
ARG VERSION
RUN cargo install "hayagriva@${VERSION}" --features=cli
ENTRYPOINT ["/usr/local/cargo/bin/hayagriva"]
