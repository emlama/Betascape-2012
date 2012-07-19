BOOTSTRAP_LESS = ./css-src/bootstrap/bootstrap.less
BOOTSTRAP_RESPONSIVE_LESS = ./css-src/bootstrap/responsive.less

all: build

build: less coffee package-js package-css

coffee:
	coffee -c -o ./js ./js-src

less:
	recess --compile  css-src/style.less > css/style.css
	recess --compress css-src/style.less > css/style.min.css

# rebuild bootstrap, if you change defaults or something
bootstrap:
	recess --compile ${BOOTSTRAP_LESS} > css/bootstrap.css
	recess --compress ${BOOTSTRAP_LESS} > css/bootstrap.min.css
	recess --compile ${BOOTSTRAP_RESPONSIVE_LESS} > css/bootstrap-responsive.css
	recess --compress ${BOOTSTRAP_RESPONSIVE_LESS} > css/bootstrap-responsive.min.css

JS_FILES= js/libs/jquery-1.7.1.min.js \
					js/libs/modernizr-2.5.3.min.js \
					js/libs/bootstrap.min.js \
					js/plugins.js \
					js/application.js

package-js: ${JS_FILES}
	## asset packager, lol
	## FINAL
	# cat ${JS_FILES} | uglifyjs > js/app.js

	## DEVELOPMENT
	cat ${JS_FILES} > js/app.js

web:
	python -m SimpleHTTPServer

