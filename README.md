# npm-install step

Executes the `npm install` command with leveraging the wercker cache mechanism
to improve installation time (optional).

If `npm install` fails, it will be retried three times before failing, and
optionally the cache will be cleared in between.

## Options

- `clear-cache-on-failed` (optional, default: `true`) If npm fails, clear the
  cache before trying again.
- `use-cache` (optional, default: `true`) Use the npm cache.
- `options` (optional) Allow for passing arbitrary arguments to npm.
- `packages` (optional) A list of the packages to install

## Example

```yaml
build:
    steps:
        - npm-install
```

# License

The MIT License (MIT)

# Changelog

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
