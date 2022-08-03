# Contributing

- Assign an issue to yourself before working on it. You should create an issue before starting to work on anything
- Fork the repository; this means you will have a copy of the repository under `your-GitHub-username/repository-name`.
- Clone the repository to your local machine using `git clone https://github.com/github-username/repository-name.git`.
- Create a branch against the main branch
- Commit messages to be prefixed by `feat`, `fix`, `chore` etc. Refer to [Conventional Commits specification](https://www.conventionalcommits.org/en/v1.0.0/)
- Create a PR to main. Pull Requests must pass the following checks;
    - Must be approved by a code owner
    - Must pass all CI Checks
    - Must include updated tests
    - Must have every conversation resolved before merging
- We encourage you to use [git rebase](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase#:~:text=What%20is%20git%20rebase%3F,of%20a%20feature%20branching%20workflow.) for a linear history

## Dart conventions

- Library, package, directory, and file names should be in `lowercase_with_underscores`.
- Type names (i.e. classes, typedefs, enum types) should be in `UpperCamelCase`
- You should name methods in `camelCase`.
- There should be only one public class per file

For more Dart conventions, refer to the [Effective Dart guide](https://dart.dev/guides/language/effective-dart)

## Other / House-keeping

- Dependencies should be ordered alphabetically
- Format files before opening a PR - `flutter format .`
- Run static analysis before opening a PR
