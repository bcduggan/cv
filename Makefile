all: cv.pdf

cv.pdf: cv.typ
	docker run \
		--rm \
		--user "$(shell id --user):$(shell id --group)" \
		--workdir "/tmp/typst" \
		--volume "$(PWD):/tmp/typst" \
		ghcr.io/typst/typst:v0.12.0 \
		compile $?

CHANGELOG :
