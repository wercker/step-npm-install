# Step npm-install

Executes the `npm install` command with leveraging the wercker cache mechanism to improve installation time (optional).

If `npm install` fails, it will be retried three times before failing, and optionally the cache will be cleared in between.

[![wercker status](https://app.wercker.com/status/cbbf25745a238ebbee40edb76955cf95/m "wercker status")](https://app.wercker.com/project/bykey/cbbf25745a238ebbee40edb76955cf95)

## Options

- `clear-cache-on-failed` (optional, default: `true`) If npm fails, clear the
  cache before trying again.
- `use-cache` (optional, default: `true`) Use the npm cache.
- `options` (optional) Allow for passing arbitrary arguments to npm.
- `packages` (optional) A list of the packages to install

## Example

The following example installs the packages listed in the `package.json` file:
```yaml
build:
  steps:
    - npm-install
```

The following example globally installs the `apidoc` and the `mocha` packages:
```yaml
build:
  steps:
    - npm-install:
        options: --global
        packages: apidoc mocha
```

# License

The MIT License (MIT)

# Changelog

## 1.2.0

- Copied the official step
- Added the `packages` option

## 1.1.4

- Ensure cache get's stored

## 1.1.1

- Add debug messages

## 1.1.0

- Add `clear-cache-on-failed`, `use-cache` options.

## 1.0.0

- Add retry on error

## 0.9.3

- Fix wrong directory cache created

## 0.9.2

- Initial release

# Credit

This step is based in the official [`wercker/npm-install`](https://github.com/wercker/step-npm-install) step as a starting point.
