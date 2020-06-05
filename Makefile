CMD := elm make
FLAGS := --optimize
OUT := --output
SRCDIR := src
SRCS := $(wildcard $(SRCDIR)/*)
SEDCMD = sed -r 's_^[^/]+/([^.]+)\.html_\1_g; s/(^|_)(.)/\U\2\E/g;' | tee hoge.txt
GETNAME = echo $@ | tee hoge1.txt | $(SEDCMD)
PAGEDIR := pages
TARGETS := $(PAGEDIR)/index.html $(PAGEDIR)/add_content.html



default: $(TARGETS)

force:
	$(MAKE) -B

$(PAGEDIR)/index.html: $(SRCDIR)/Main.elm
	$(CMD) $(FLAGS) $< $(OUT)=$@

$(PAGEDIR)/add_content.html: $(SRCDIR)/AddContent.elm
	$(CMD) $(FLAGS) $< $(OUT)=$@


.PHONY: default



$(PAGEDIR)/_.html: $(SRCDIR)/_.elm
	$(CMD) $(FLAGS) $< $(OUT)=$@
