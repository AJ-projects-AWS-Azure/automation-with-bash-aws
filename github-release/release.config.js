module.exports = {
  branches: ["main"],
  plugins: [
    "@semantic-release/commit-analyzer",
    "@semantic-release/release-notes-generator",
    "@semantic-release/changelog",
    [
      "@semantic-release/git",
      {
        assets: ["CHANGELOG.md"]
      }
    ],
    "@semantic-release/github"
  ]
};

/*
| Commit message               | Version bump |
| ---------------------------- | ------------ |
| `feat:`                      | minor        |
| `fix:`                       | patch        |
| `feat!:`, `BREAKING CHANGE:` | major        |
*/