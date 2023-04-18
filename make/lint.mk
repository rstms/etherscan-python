# python lint makefile

### format source and lint
fmt:
	isort $(src_dirs)
	black -t py310 $(src_dirs)
	flake8 --max-line-length 135 $(src_dirs)


### vim autofix
fix:
	fixlint $(src_dirs)

lint-clean:
	rm -f .lint .fmt .flake8 .black .errors
