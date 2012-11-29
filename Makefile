TARGET ?= /kb/deployment
DEPLOY_RUNTIME ?= /kb/runtime
TOP_DIR = ../..
SERVICE = matR
SERVICE_DIR = $(TARGET)/services/$(SERVICE)
DOC_DIR = $(SERVICE_DIR)/webroot

all:
	git clone -b master git://github.com/MG-RAST/matR.git
	R CMD BATCH install-matr.R

deploy: deploy-docs
	cp matR/README readme.txt
	mkdir $(SERVICE_DIR)

deploy-docs:
	mkdir $(DOC_DIR)
	cp matR/README $(DOC_DIR)/README.md
	cp matR/DESCRIPTION $(DOC_DIR)/DESCRIPTION.md

# need target to make test
test:
	echo "No automatic tests yet, manually run 'demo'. See readme.txt"
