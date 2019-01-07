workflow "CI" {
  on = "push"
  resolves = [
    "Test",
    "Lint",
  ]
}

action "Build" {
  uses = "actions/docker/cli@76ff57a6c3d817840574a98950b0c7bc4e8a13a8"
  args = "build --target dev -t co0sh/node-typescript-boilerplate:$GITHUB_SHA ."
}

action "Style" {
  uses = "actions/docker/cli@76ff57a6c3d817840574a98950b0c7bc4e8a13a8"
  needs = ["Build"]
  args = "run --rm co0sh/node-typescript-boilerplate:$GITHUB_SHA npm run style"
}

action "Lint" {
  uses = "actions/docker/cli@76ff57a6c3d817840574a98950b0c7bc4e8a13a8"
  needs = ["Build"]
  args = "run --rm co0sh/node-typescript-boilerplate:$GITHUB_SHA npm run lint"
}

action "Test" {
  uses = "actions/docker/cli@76ff57a6c3d817840574a98950b0c7bc4e8a13a8"
  needs = ["Build"]
  args = "run --rm co0sh/node-typescript-boilerplate:$GITHUB_SHA npm run test"
}
