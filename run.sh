mkdir -p $WERCKER_CACHE_DIR/wercker/npm
npm config set cache $WERCKER_CACHE_DIR/wercker/npm
npm config set tmp $WERCKER_CACHE_DIR/wercker/tmp
npm install $WERCKER_NPM_INSTALL_OPTIONS
