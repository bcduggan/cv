docker-run = $(MAKE) -C docker "bin/$(1)" && "./docker/bin/$(1)"

GIT-CLIFF = $(call docker-run,git-cliff)
TYPST = $(call docker-run,typst)
HAYAGRIVA = $(call docker-run,hayagriva)

version = $(shell $(TYPST) query src/cv/main.typ "<version>" --field "value" --one)

all: dist/cv.pdf

cliff.toml:
	$(GIT-CLIFF) --init keepachangelog

CHANGELOG.md: cliff.toml
	$(GIT-CLIFF) --tag "v${version}" --output $@

dist:
	mkdir dist

dist/%.pdf: src/%/main.typ | dist
	$(TYPST) compile $< $@

.PHONY: clean
clean:
	[ -d dist ] && rm dist/*.pdf
