ELM_FLAGS :=
SRC_DIR := src
ELM_SRCS := $(wildcard $(SRC_DIR)/*)
OUT_DIR := pages
TARGETS := $(OUT_DIR)/index.html $(OUT_DIR)/add_content.html

ifdef RELEASE
	ELM_FLAGS += --optimize
endif


default: all


$(OUT_DIR)/index.html: $(SRC_DIR)/Main.elm
	elm make $(ELM_FLAGS) $< --output=$@

$(OUT_DIR)/add_content.html: $(SRC_DIR)/AddContent.elm
	elm make $(ELM_FLAGS) $< --output=$@


all: $(TARGETS)

clean:
	rm -rf $(TARGETS)

.PHONY: default all release clean
