abspath_to_makefile := $(abspath $(lastword $(MAKEFILE_LIST)))
makefile_dir := $(patsubst %/,%,$(dir $(abspath_to_makefile)))

.PHONY: all
all: install

libs := $(notdir $(wildcard $(makefile_dir)/lib/*.sh))
install_libs := $(libs:%=install_%)

dotfiles := $(filter-out . .. .git,$(notdir $(wildcard $(makefile_dir)/.*)))
install_dotfiles := $(dotfiles:%=install_%)

.PHONY: install
install: $(install_libs) $(install_dotfiles)

lib_dir := $(HOME)/lib

.PHONY: $(install_libs)
$(install_libs): | $(lib_dir)
	$(eval lib := $(@:install_%=%))
	cp -f $(makefile_dir)/lib/$(lib) $(lib_dir)/$(lib)

$(lib_dir):
	mkdir -p $@

.PHONY: $(install_dotfiles)
$(install_dotfiles):
	$(eval dotfile := $(@:install_%=%))
	cp -f $(makefile_dir)/$(dotfile) $(HOME)/$(dotfile)

uninstall_dotfiles := $(dotfiles:%=uninstall_%)

.PHONY: uninstall
uninstall: $(uninstall_dotfiles) remove_lib_dir 

.PHONY: $(uninstall_dotfiles)
$(uninstall_dotfiles):
	$(eval dotfile := $(@:uninstall_%=%))
	rm -f $(HOME)/$(dotfile)

uninstall_libs := $(libs:%=uninstall_%)

.PHONY: remove_lib_dir
remove_lib_dir: $(uninstall_libs)
	rmdir $(lib_dir) 2> /dev/null || exit 0

.PHONY: $(uninstall_libs)
$(uninstall_libs):
	$(eval lib := $(@:uninstall_%=%))
	rm -f $(lib_dir)/$(lib)
