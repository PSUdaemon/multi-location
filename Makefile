MMARKXML=mmark -xml2 -page
XML2RFC=xml2rfc
RFC2TXT=$(XML2RFC) --text
RFC2HTML=$(XML2RFC) --html

SOURCES=draft-sorber-multi-location.md
XML_OUTPUT=$(SOURCES:.md=.xml)
TXT_OUTPUT=$(SOURCES:.md=.txt)
HTML_OUTPUT=$(SOURCES:.md=.html)
OUTPUT=$(XML_OUTPUT) $(TXT_OUTPUT) $(HTML_OUTPUT)

all : $(OUTPUT)

xmldocs : $(XML_OUTPUT)

txtdocs : $(TXT_OUTPUT)

htmldocs : $(HTML_DOCS)

clearcache :
	$(XML2RFC) --clear-cache

clean : clearcache
	rm -rf $(OUTPUT)

%.xml : %.md
	$(MMARKXML) $< > $(XML_OUTPUT)

%.html : %.xml
	$(RFC2HTML) $<

%.txt :  %.xml
	$(RFC2TXT) $<

.PHONY : all clean clearcache xmldocs txtdocs htmldocs
