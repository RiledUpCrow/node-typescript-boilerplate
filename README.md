# Node + TypeScript + Express boilerplate

This is a boilerplate for Node with Express server using TypeScript. It includes:

- Automatic restart on file save with `nodemon`
- Automatic transpilation of TypeScript code with `ts-node`
- Easy debugging in Visual Studio Code
- Testing with `jest`
- Code formatting with `prettier`
- Code linting with `tslint`
- Git hooks with `husky`

## Requirements

You should have at least Node 8.10.0.

## Setup with Visual Studio Code

Configure default build and test tasks by pasting this into `.vscode/tasks.json`:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "type": "npm",
      "script": "dev",
      "group": {
        "kind": "build",
        "isDefault": true
      }
    },
    {
      "type": "npm",
      "script": "test:watch",
      "group": {
        "kind": "test",
        "isDefault": true
      }
    }
  ]
}
```

Configure the debugger to attach to a running Node process by pasting this into `.vscode/launch.json`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "node",
      "request": "attach",
      "name": "Attach to Node",
      "address": "localhost",
      "port": 5858,
      "restart": true,
      "protocol": "inspector"
    }
  ]
}
```

## Usage

Start a development server with automatic restart:

```
yarn dev
```

Build the project:

```
yarn build
```

Test the project (optionally with coverage or in watch mode):

```
yarn test
yarn test:coverage
yarn test:watch
```

Format the code with Prettier:

```
yarn format
```

Lint the code with TSLint:

```
yarn lint
```

## Git hooks

The project contains a pre-commit git hook which checks the code with Prettier and TSLint, so you cannot commit low quality code.

It also has a pre-push hook which runs all tests and builds the project, so you cannot push broken code to the repository.

You can disable these hooks by adding `--no-verify` flag to your `git commit` or `git push` command.
