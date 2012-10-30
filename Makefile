
all: deploy

deploy:
	git submodule init
	git submodule update
	R CMD BATCH install-matr.R
