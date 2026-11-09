TARGET = ZJU_BeamerTemplate
SRC = $(TARGET).tex
PDF = $(TARGET).pdf

.PHONY: all init renew clean help

all: $(PDF)

$(PDF): $(SRC)
	xelatex -interaction=nonstopmode -synctex=1 $(SRC)
	xelatex -interaction=nonstopmode -synctex=1 $(SRC)
	bibtex $(TARGET)
	xelatex -interaction=nonstopmode -synctex=1 $(SRC)

init: renew clean

renew: 
	find figures/ -type f ! -name 'char.pdf' ! -name 'char-blue.pdf' ! -name 'example.png' ! -name 'logo.pdf' ! -name 'logo-blue.pdf' ! -name 'background.png' -delete


clean:
	@echo "Cleaning up..."
	@rm -f $(TARGET).aux $(TARGET).log $(TARGET).out $(TARGET).toc $(TARGET).bbl $(TARGET).blg $(TARGET).fls $(TARGET).fdb_latexmk $(TARGET).nav $(TARGET).snm $(TARGET).vrb *.log
	@echo "Done!"
	
help:
	@echo "Makefile Help:"
	@echo "  all    - Build the PDF document using xelatex."
	@echo "  init   - Rebuild the whole project."
	@echo "  clean  - Remove auxiliary files generated during the build process."
	@echo "  help   - Display this help message."
