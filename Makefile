# Copy IDE config files 

intellij_codestyles_dir=intellij/codestyles
intellij_project_codestyles_file=$(intellij_codestyles_dir)/codeStyleSettings.xml
intellij_inspection_dir=intellij/inspectionProfiles
intellij_copyright_dir=intellij/copyright

intellij_codestyles_home=~/.IntelliJIdea11/config/codestyles
intellij_inspection_home=~/.IntelliJIdea11/config/inspection

project_idea_dir=${p}/.idea
project_codestyles_dir=$(project_idea_dir)/codestyles
project_codestyles_file=$(project_idea_dir)/codeStyleSettings.xml
project_inspection_dir=$(project_idea_dir)/inspectionProfiles
project_copyright_dir=$(project_idea_dir)/copyright


all: help

help:
	@echo "Available make targets:"
	@echo
	@echo "  import-to-intellij  : Copy code style settings to IntelliJ Idea config directory (~/.IntelliJIdea11)."
	@echo	
	@echo "  import-to-project   : Copy code style, inspection and copyright settings to specified project (p)."
	@echo "                        make import-to-project p=<project_path>"
	@echo
	@echo "  export-from-project : Copy code style, inspection and copyright settings from specified project (p)."
	@echo "                        make export-from-project p=<project_path>"
	@echo


import-to-intellij:
	cp $(intellij_project_codestyles_file) $(intellij_codestyles_home)/Obiba.xml

project: 
#	cp $(intellij_project_codestyles_file) $(project_idea_dir) && \
#	cp $(intellij_inspection_dir)/* $(project_inspection_dir) && \

	mkdir -p $(project_codestyles_dir)
	cp $(intellij_codestyles_dir)/* $(project_codestyles_dir)
	mkdir -p $(project_copyright_dir)
	cp $(intellij_copyright_dir)/* $(project_copyright_dir)

export-from-project:	
	cp $(project_codestyles_file) $(intellij_project_codestyles_file) && \
	if test -d $(project_inspection_dir); then cp $(project_inspection_dir)/* $(intellij_inspection_dir); fi && \
	if test -d $(project_copyright_dir); then cp $(project_copyright_dir)/* $(intellij_copyright_dir); fi
