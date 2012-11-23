# Copy IDE config files 

all: help

help:
	@echo "Available make targets:"
	@echo
	@echo "  import-to-intellij  : Copy code style and inspection settings to IntelliJ Idea config directory (~/.IntelliJIdea11)."
	@echo	
	@echo "  import-to-project   : Copy code style, inspection and copyright settings to specified project (p)."
	@echo "                        make import-to-project p=<project_path>"
	@echo
	@echo "  export-from-project : Copy code style, inspection and copyright settings from specified project (p)."
	@echo "                        make export-from-project p=<project_path>"
	@echo


import-to-intellij:
	cp intellij/codestyles/* ~/.IntelliJIdea11/config/codestyles && \
	cp intellij/inspection/* ~/.IntelliJIdea11/config/inspection

import-to-project:
	cp intellij/codestyles/* ${p}/.idea/codestyles && \
	cp intellij/inspection/* ${p}/.idea/inspectionProfiles && \
	cp intellij/copyright/* ${p}/.idea/copyright

export-from-project:
	cp ${p}/.idea/codestyles/* intellij/codestyles && \
	cp ${p}/.idea/inspectionProfiles/* intellij/inspection && \
	cp ${p}/.idea/copyright/* intellij/copyright 