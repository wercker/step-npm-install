# npm-install step

Executes the `npm install` command with leveraging the wercker cache mechanism to improve installation time.

## Options

### options
- type: string
- optional: true
- description: Passed through to npm install
- example: `options: -g bower`

## Example

    - npm-install
