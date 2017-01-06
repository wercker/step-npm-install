# npm-install-cwd step

Executes the `npm install` command with leveraging the wercker cache mechanism
to improve installation time (optional).

If `npm install` fails, it will be retried three times before failing, and
optionally the cache will be cleared in between.

## Options

- `clear-cache-on-failed` (optional, default: `true`) If npm fails, clear the
  cache before trying again.
- `use-cache` (optional, default: `true`) Use the npm cache.
- `options` (optional) Allow for passing arbitrary arguments to npm.
- `cwd` (optional, default: `./`) The directory to run `npm-install` in

## Example

```yaml
build:
    steps:
        - abuecker/npm-install-cwd
```

# License

The MIT License (MIT)

# Changelog

## 0.0.1

- Forked from 1.1.4 and added CWD support
