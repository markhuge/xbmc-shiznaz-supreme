PATH := ./node_modules/.bin:${PATH}

build:
	coffee -b -o lib/ -c src/ 
