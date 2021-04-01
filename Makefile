ELM_FLAGS :=
SRC_DIR := src
ELM_SRCS := $(wildcard $(SRC_DIR)/*)
OUT_DIR := pages
TARGETS := $(OUT_DIR)/index.html $(OUT_DIR)/add_content.html

ifdef RELEASE
	ELM_FLAGS += --optimize
endif


default: all

build:
	yarn run build

dev-server:
	dcp run -p 3001:3001 app yarn dev

$(OUT_DIR)/index.html: $(SRC_DIR)/Main.elm
	npx elm make $(ELM_FLAGS) $< --output=$@

$(OUT_DIR)/add_content.html: $(SRC_DIR)/AddContent.elm
	npx elm make $(ELM_FLAGS) $< --output=$@


all: $(TARGETS)

clean:
	rm -rf $(TARGETS)

.PHONY: default all release clean
