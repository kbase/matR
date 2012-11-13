
all: deploy

deploy:
	git clone -b master git://github.com/MG-RAST/matR.git
	R CMD BATCH install-matr.R
	cp matR/README readme.txt
