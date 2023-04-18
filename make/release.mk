### create a new github release

#git_revision != git log -1 | awk '{print $2; exit}'
#release_note != git log --format=%s%N -r $(git_revision) -1

github = gh -R $(GITHUB_ORG)/$(project)

release: wheel
	$(github) release create v$(version) --generate-notes --target master
	$(github) release upload v$(version) $(wheel)

release-clean:

