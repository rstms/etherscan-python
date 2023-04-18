# create distributable files if sources have changed

.PHONY: latest-release dist release release-clean

current_wheel != ls 2>/dev/null dist/$(module)-$(version)-*.whl
current_release = dist/$(module)-$(version)-release.json

$(if $(GITHUB_ORG),,$(error GITHUB_ORG is undefined))
$(if $(GITHUB_TOKEN),,$(error GITHUB_TOKEN is undefined))

RELEASE = release \
  --organization $(GITHUB_ORG)\
  --repository $(project)\
  --token $(GITHUB_TOKEN)\
  --module-dir ./$(module)\
  --wheel-dir ./dist\
  --version $(version) 

check_wheel = $(if $(shell [ -s $(current_wheel) ] && echo y),,$(error wheel file null or nonexistent))

### query github and output the latest release version
latest-release:
	@echo $(call latest_release)

.dist: VERSION
	$(call gitclean)
	mkdir -p dist
	rm -f dist/seven?api-*
	flit build

### build a wheel file for distribution
dist: $(if $(DISABLE_TOX),,tox)
	@[ -s "$(current_wheel)" ] && echo "$(current_wheel) is up to date." || $(MAKE) --no-print-directory .dist 


### create a github release and upload assets
release: dist
	$(call check_wheel)
	@set -e;\
	if [ "$(call latest_release)" = "$(version)" ]; then \
	  echo "Version $(version) is already released"; \
	else \
	  echo "Creating $(project) release v$(version)..."; \
	  $(RELEASE) create --force >$@; \
	  $(RELEASE) upload --force >>$@; \
	fi


### make a release without running tox tests
detox-release:
	$(MAKE) DISABLE_TOX=1 release


# clean up the release temp files
release-clean:
	rm -f .dist



