export USER_ID = $(shell id --user)
export GROUP_ID = $(shell id --group)
export USER_NAME = $(shell grep '^.*:.*:$(USER_ID):' /etc/passwd | cut --delimiter=':' --fields=1)
export GROUP_NAME = $(shell grep '^.*:.*:$(GROUP_ID):' /etc/group | cut --delimiter=':' --fields=1)

bin/%:
	docker builder bake "$*"
	ln --symbolic --force ../libexec/run "$@"

.PHONY: clean
clean:
	rm --force bin/*
	docker image ls --quiet --filter="label=net.dugga.cv.tool" | uniq | xargs --no-run-if-empty docker image rm --force
	docker image prune --all --force --filter="label=net.dugga.cv.tool"
