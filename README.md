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
      "label": "Start",
      "type": "npm",
      "script": "dev",
      "group": {
        "kind": "build",
        "isDefault": true
      }
    },
    {
      "label": "Test",
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
npm run dev
```

Build the project:

```
npm run build
```

Test the project (optionally with coverage or in watch mode):

```
npm run test
npm run test:coverage
npm run test:watch
```

Format the code with Prettier:

```
npm run format
```

Lint the code with TSLint:

```
npm run lint
```

## Git hooks

The project contains a pre-commit git hook which checks the code with Prettier and a pre-push hook for checking TSLint. You can disable these hooks by adding `--no-verify` flag to your `git commit` or `git push` command.

## Docker

You can build the project as a Docker image with a standard `docker build` command. The commands below let you quickly build and run the example on port 80:

```
docker build -t node-ts:latest .
docker run --rm -it -p 80:8080 --pid=host node-ts:latest
```

The server should be available under your Docker machine address, for example:

```
http://localhost/hello/World
```

The container will be removed when you press `Ctrl+C`.
