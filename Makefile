
# Needs to have these variables defined here, or by the dev_container makefile
TOP_DIR = ../..
DEPLOY_RUNTIME ?= /kb/runtime
TARGET ?= /kb/deployment

# default make target should not deploy, but should build all code
all:

# deploy should also call deploy-docs, and deploy should copy any code to deploy in
# to the deployment target directory. Nothing created in this directory will be deployed
# see example makefile in dev_container_tools/lib/module.Makefile
deploy: deploy-docs
	git clone -b master git://github.com/MG-RAST/matR.git
	R CMD BATCH install-matr.R
	cp matR/README readme.txt

# need target to deploy docs to copy documentation to service/SERVICE_NAME/webroot dir
deploy-docs:

# need target to make test
test:
