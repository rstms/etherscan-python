### create a new github release

#git_revision != git log -1 | awk '{print $2; exit}'
#release_note != git log --format=%s%N -r $(git_revision) -1

release: wheel
	gh release create v$(version) --generate-notes --target master
	gh release upload v$(version) $(wheel)

release-clean:

