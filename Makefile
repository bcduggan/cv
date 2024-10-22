docker-run := docker run --rm --workdir "/work" --volume "${PWD}:/work"
git-cliff := ${docker-run} ghcr.io/orhun/git-cliff/git-cliff:main

cliff.toml:
	${git-cliff} --init keepachangelog
