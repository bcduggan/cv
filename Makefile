all: brian-duggan-cv.pdf

# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html
brian-duggan-cv.pdf: brian-duggan-cv.typ
	docker run \
		--rm \
		--workdir "/typst" \
		--volume "$(PWD):/typst" \
		ghcr.io/typst/typst:v0.12.0 \
		compile $?
