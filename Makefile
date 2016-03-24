MD_FILES := $(wildcard *.md)
DOCX_FILES = $(patsubst %.md,build/%.docx,$(MD_FILES))

all: $(DOCX_FILES)
	mkdir -p build/
	

build/%.docx: %.md
	mkdir -p build/
	pandoc $< -s -o $@

clean:
	rm -rf build/
