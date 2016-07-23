.SUFFIXES: .tex .dvi .pdf .ps .aux .log .lof .lot .toc .lol .cls .sty .dtx .ins .idx .ind .glo .gls .ilg 

# file setting
lll=	lll
main=	tls
src=	01preface.tex 02thanx.tex 03edit.tex 04pic.tex 05graph.tex \
	06biblio.tex 07img.tex 08pres.tex 09apply.tex \
	ap-change.tex ap-fdl.tex changes.tex
sty=	gind.ist \
	jisyo.dic \
	sgls.ist \
	sind.ist \
	splain.bst \
	labelfig.sty labelfig.tex 

# program setting
latex=	platex
dvipdf=	dvipdfmx 
dvips=	dvips -Ppdf
xdvi=	xdvi
makeindex=mendex -d jisyo.dic
bibtex=	jbibtex


all: $(lll).sty $(lll).pdf

quick:	$(main).tex
	$(latex) $< && $(latex) $<

$(main).dvi:	$(main).tex
	$(latex) $< && $(latex) $<
	$(makeindex) -s sind.ist -o $*.ind $*.idx
#	$(makeindex) -s sgls.ist -o $*.gls $*.glo
	$(latex) $< && $(latex) $<

$(main)hyper.tex: $(main).tex
	echo -e "\AtBeginDvi{\special{pdf:tounicode EUC-UCS2}}"\
	> $(main)hyper.tex
	echo -e "\def\hogeHyper{hoge}" >> $(main)hyper.tex
	grep "%" $(main).tex >> $(main)hyper.tex

$(main)hyper.dvi: $(main)hyper.tex
	$(latex) $< && $(latex) $<
	$(makeindex) -s sind.ist -o $*.ind $*.idx
#	$(makeindex) -s sgls.ist -o $*.gls $*.glo
	$(latex) $< && $(latex) $<

$(lll).dvi:	$(lll).dtx
	$(latex) $< && $(latex) $<
#	$(makeindex) -s gind.ist -o $*.ind $*.idx
	$(latex) $<

$(lll).pdf:	$(lll).dvi
$(lll).ps:	$(lll).dvi
$(lll).ind:	$(lll).idx
$(lll).idx:	$(lll).tex
$(lll).sty:	$(lll).dtx

$(main).pdf:	$(main).dvi
$(main).ps:	$(main).ps
$(main).dvi:	$(main).tex

$(main)hyper.pdf:	$(main)hyper.dvi
$(main)hyper.ps:	$(main)hyper.ps

.dvi.pdf:
	$(dvipdf) -o $@ $<
.dvi.ps:
	$(dvips) -o $@ $<
.dtx.dvi:
	$(latex) $< && $(latex) $<
.ins.sty:
	$(latex) $*.ins
.tex.dvi:
	$(latex) $< && $(latex) $<
.idx.ind:
	$(makeindex) -s gind.ist -o $*.ind $<
.glo.gls:
	$(makeindex) -s gglo.ist -o $*.gls $<
.tex.idx:
	$(latex) $<
.tex.glo:
	$(latex) $<
.tex.toc:
	$(latex) $<
.bib.bbl:
	$(bibtex) $*

clean:
	rm -f $(lll).dvi $(lll).ind $(lll).idx $(lll).ps $(lll).pdf
	rm -f $(lll).ilg $(lll).toc
	rm -f $(main).dvi $(main).glo $(main).gls $(main).ind
	rm -f $(main).idx $(main).lof $(main).lot $(main).lol
	rm -f $(main).toc $(main).ps $(main).pdf
	rm -f *.aux *.log *.*~

cleanall:	clean
	rm -f $(main)hyper.dvi $(main)hyper.glo $(main)hyper.gls
	rm -f $(main)hyper.idx $(main)hyper.ilg $(main)hyper.ind
	rm -f $(main)hyper.lof $(main)hyper.lol $(main)hyper.lot
	rm -f $(main)hyper.out $(main)hyper.toc

dist: $(lll).sty $(lll).pdf $(lll).ps 
	mkdir -p $(main)src/images/
	cp $(main).tex Makefile $(src) $(sty) $(lll).sty $(lll).ins \
	$(lll).dtx $(lll).ps $(lll).pdf $(main)src/
	cp images/*.* $(main)src/images/
	tar czf $(main)src.tgz $(main)src/
	rm -fr $(main)src
