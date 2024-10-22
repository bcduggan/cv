docker-run := docker run --rm --workdir "/work" --volume "${PWD}:/work"
git-cliff := ${docker-run} ghcr.io/orhun/git-cliff/git-cliff:main
typst := ${docker-run} ghcr.io/typst/typst:v0.12.0

cliff.toml:
	${git-cliff} --init keepachangelog

cv.pdf: cv.typ
	${typst} compile $^
