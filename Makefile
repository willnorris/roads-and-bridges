NAME=roads-and-bridges
EPUB=${NAME}.epub
MOBI=${NAME}.mobi

ALL: clean ${EPUB}

${EPUB}:
	zip -Xj0 ${EPUB} src/mimetype
	cd src; zip -Xur9D ../${EPUB} *

${MOBI}: ${EPUB}
	ebook-convert ${EPUB} ${MOBI}

test:
	epubcheck -mode exp src

tidy:
	tidy -q -m --indent yes --indent-spaces 2 --tidy-mark no -w 120 `ls src/EPUB/*.xhtml | grep -v nav.xhtml`

clean:
	rm -f ${EPUB} ${MOBI}
