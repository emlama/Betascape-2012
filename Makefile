BOOTSTRAP_LESS = ./css-src/bootstrap/bootstrap.less
BOOTSTRAP_RESPONSIVE_LESS = ./css-src/bootstrap/responsive.less

all: build

build: less coffee

coffee:
	coffee -c -o ./js ./js-src

coffee-watch:
	coffee -w -c -o ./js ./js-src

less:
	recess --compile  css-src/style.less > css/style.css
	recess --compress css-src/style.less > css/style.min.css

less-watch:
	recess css-src/style.less:css/style.css --watch css-src/

# rebuild bootstrap, if you change defaults or something
bootstrap:
	recess --compile ${BOOTSTRAP_LESS} > css/bootstrap.css
	recess --compress ${BOOTSTRAP_LESS} > css/bootstrap.min.css
	recess --compile ${BOOTSTRAP_RESPONSIVE_LESS} > css/bootstrap-responsive.css
	recess --compress ${BOOTSTRAP_RESPONSIVE_LESS} > css/bootstrap-responsive.min.css

web:
	python -m SimpleHTTPServer

