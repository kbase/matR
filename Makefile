TARGET ?= /kb/deployment
DEPLOY_RUNTIME ?= /kb/runtime
SERVICE = matR
SERVICE_DIR = $(TARGET)/services/$(SERVICE)
DOC_DIR = $(SERVICE_DIR)/webroot

default: build-libs

build-libs:
	R CMD BATCH install-matr.R

deploy: deploy-client deploy-scripts deploy-server deploy-docs

deploy-libs: build-libs

deploy-client: deploy-libs
	cp matR/README readme.txt
	mkdir $(SERVICE_DIR)

deploy-scripts:
	"No scripts to install"

deploy-server:
	"No server to install"

deploy-docs:
	mkdir $(DOC_DIR)
	cp matR/README $(DOC_DIR)/README.md
	cp matR/DESCRIPTION $(DOC_DIR)/DESCRIPTION.md

test: test-server test-scripts test-client

test-client:
	echo "No automatic client tests yet, manually run 'demo'. See readme.txt"

test-scripts:
	echo "No scripts to test"

test-server:
	echo "No server to test"
