workflow "CI" {
  on = "push"
  resolves = [
    "Lint",
    "Test",
    "Build Release",
  ]
}

action "Build Dev" {
  uses = "actions/docker/cli@76ff57a6c3d817840574a98950b0c7bc4e8a13a8"
  args = "build --target dev -t co0sh/node-typescript-boilerplate:$GITHUB_SHA ."
}

action "Style" {
  uses = "actions/docker/cli@76ff57a6c3d817840574a98950b0c7bc4e8a13a8"
  args = "run --rm co0sh/node-typescript-boilerplate:$GITHUB_SHA npm run style"
  needs = ["Build Dev"]
}

action "Lint" {
  uses = "actions/docker/cli@76ff57a6c3d817840574a98950b0c7bc4e8a13a8"
  args = "run --rm co0sh/node-typescript-boilerplate:$GITHUB_SHA npm run lint"
  needs = ["Build Dev"]
}

action "Test" {
  uses = "actions/docker/cli@76ff57a6c3d817840574a98950b0c7bc4e8a13a8"
  args = "run --rm co0sh/node-typescript-boilerplate:$GITHUB_SHA npm run test"
  needs = ["Build Dev"]
}

action "Build Release" {
  uses = "actions/docker/cli@76ff57a6c3d817840574a98950b0c7bc4e8a13a8"
  needs = ["Style", "Lint", "Test"]
  args = "build -t co0sh/node-typescript-boilerplate:$GITHUB_SHA ."
}
