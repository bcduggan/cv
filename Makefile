all: cv

cv: cv.typ
	docker run \
		--rm \
		--workdir "/typst" \
		--volume "$(PWD):/typst" \
		ghcr.io/typst/typst:v0.12.0 \
		compile $?

