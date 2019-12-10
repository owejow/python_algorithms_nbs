SRC = $(wildcard ./nbs//*.ipynb)

all: python_algorithms_nbs docs

python_algorithms_nbs: $(SRC)
	nbdev_build_lib
	touch python_algorithms_nbs

docs: $(SRC)
	nbdev_build_docs
	touch docs

test:
	nbdev_test_nbs

pypi: dist
	twine upload --repository pypi dist/*

dist: clean
	python setup.py sdist bdist_wheel

clean:
	rm -rf dist