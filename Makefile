GO_PROGRAMS := aoc-download aoc-start aoc-scores
SH_SCRIPTS := aoc.sh aoc-leaderboard.sh
PREFIX := /usr/local
GO_BUILDS := $(patsubst %,build/%,$(GO_PROGRAMS))
SH_BUILDS := $(patsubst %.sh,build/%,$(SH_SCRIPTS))
GO_INSTALLS := $(patsubst %,$(PREFIX)/bin/%,$(GO_PROGRAMS))
SH_INSTALLS := $(patsubst %.sh,$(PREFIX)/bin/%,$(SH_SCRIPTS))
TEMPLATES := aoc-start/template/main.go aoc-start/template/main_test.go
DEFAULT_LEADERBOARD := 534400
.PHONY: build clean install

build: $(GO_BUILDS) $(SH_BUILDS)

build/aoc: aoc.sh Makefile
	mkdir -p build
	cp $< $@
	chmod ugo+x $@

build/aoc-leaderboard: aoc-leaderboard.sh Makefile
	mkdir -p build
	sed -e 's/@@DEFAULT_LEADERBOARD@@/$(DEFAULT_LEADERBOARD)/g' < $< > $@
	chmod ugo+x $@

go.sum: Makefile go.mod
	go mod tidy

build/aoc-start: Makefile go.mod go.sum aoc-start/main.go $(TEMPLATES)
	mkdir -p build
	go build -o $@ ./$(notdir $@)

build/aoc-%: Makefile go.mod go.sum aoc-%/main.go
	mkdir -p build
	go build -o $@ ./$(notdir $@)

clean: ## Remove all local artifacts
	rm -rf build || true
	go clean

$(GO_INSTALLS) $(SH_INSTALLS): $(PREFIX)/bin/%: build/%
	install -d $(PREFIX)/bin
	install -m 755 $< $@

install: $(GO_INSTALLS) $(SH_INSTALLS)
