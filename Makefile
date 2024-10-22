docker-run := docker run --rm --workdir "/work" --volume "${PWD}:/work"
git-cliff := ${docker-run} ghcr.io/orhun/git-cliff/git-cliff:main
typst := ${docker-run} ghcr.io/typst/typst:v0.12.0

version := $(shell bash -c '${typst} query cv.typ "<version>" --field "value" --one')

cliff.toml:
	${git-cliff} --init keepachangelog

cv.pdf: cv.typ
	${typst} compile $^

CHANGELOG.md: cliff.toml
	${git-cliff} --tag "v${version}" --output $@
