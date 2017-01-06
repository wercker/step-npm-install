#!/bin/bash

main() {
  if [ "$WERCKER_NPM_INSTALL_CWD_USE_CACHE" == "true" ]; then
    info "Using wercker cache"
    setup_cache
  fi

  set +e
  npm_install
  set -e

  success "Finished npm install"
}

setup_cache() {
  debug 'Creating $WERCKER_CACHE_DIR/wercker/npm'
  mkdir -p "$WERCKER_CACHE_DIR/wercker/npm"
  
  debug 'Configuring npm to use wercker cache'
  npm config set cache "$WERCKER_CACHE_DIR/wercker/npm"
}

clear_cache() {
  warn "Clearing npm cache"
  npm cache clear
  
  # make sure the cache contains something, so it will override cache that get's stored
  debug 'Creating $WERCKER_CACHE_DIR/wercker/npm'
  mkdir -p "$WERCKER_CACHE_DIR/wercker/npm"
  printf keep > "$WERCKER_CACHE_DIR/wercker/npm/.keep"
}

npm_install() {
  local retries=3;
  for try in $(seq "$retries"); do
    info "Starting npm install, try: $try"
    cd $WERCKER_NPM_INSTALL_CWD_CWD && npm install $WERCKER_NPM_INSTALL_CWD_OPTIONS && return;

    if [ "$WERCKER_NPM_INSTALL_CWD_CLEAR_CACHE_ON_FAILED" == "true" ]; then
      clear_cache
    fi
  done

  fail "Failed to successfully execute npm install, retries: $retries"
}

main;
