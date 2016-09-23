EPUB=roads-and-bridges.epub

ALL: clean ${EPUB}

${EPUB}:
	zip -Xj0 ${EPUB} src/mimetype
	cd src; zip -Xur9D ../${EPUB} *

test:
	epubcheck -mode exp src

clean:
	rm -f ${EPUB}
