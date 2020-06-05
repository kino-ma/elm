MAKE = elm make
OUT = --output
SRC = src
PAGEDIR = pages


default: main add_content

main:
	$(MAKE) $(SRC)/Main.elm $(OUT)=$(PAGEDIR)/index.html

add_content:
	$(MAKE) $(SRC)/AddContent.elm $(OUT)=$(PAGEDIR)/add_content.html

#main_:
#	$(MAKE) $(SRC)/Main.elm $(OUT)=$(PAGEDIR)/index.html
