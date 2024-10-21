all: cv.pdf

cv.pdf: cv.typ
	docker compose run typst compile $?

CHANGELOG:
	docker compose run git-cliff --output CHANGELOG.md
