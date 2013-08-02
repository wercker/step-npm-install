mkdir -p $WERCKER_CACHE_DIR/wercker/npm
npm config set cache $WERCKER_CACHE_DIR/cache/wercker/npm
npm install $WERCKER_NPM_INSTALL_OPTIONS
