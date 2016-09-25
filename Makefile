EPUB=roads-and-bridges.epub

ALL: clean ${EPUB}

${EPUB}:
	zip -Xj0 ${EPUB} src/mimetype
	cd src; zip -Xur9D ../${EPUB} *

test:
	epubcheck -mode exp src

tidy:
	tidy -m --indent yes --tidy-mark no -w 120 `ls src/EPUB/*.xhtml | grep -v nav.xhtml`

clean:
	rm -f ${EPUB}
