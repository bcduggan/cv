docker-run := docker run \
		--rm \
		--user "$(shell id --user):$(shell id --group)" \
		--workdir "/tmp/work" \
		--volume "$(PWD):/tmp/work"

all: cv.pdf

cv.pdf: cv.typ
	${docker-run} ghcr.io/typst/typst:v0.12.0 compile $?

CHANGELOG:
	${docker-run} ghcr.io/orhun/git-cliff/git-cliff:main
