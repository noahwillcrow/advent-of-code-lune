# Advent of Code with Lune
This is a template repository for using Lune for Advent of Code. This was inspired by [Adrian Klimek's advent-of-code-bun](https://github.com/adrianklimek/advent-of-code-bun).

# Using this template
1. Create a local copy of this template
    - fork, copy, whatever you want
2. Either use the included devcontainer definition or ensure you have [Lune](https://lune-org.github.io/) installed.
3. Open a terminal in the `src` directory
4. Run the prepare script for whatever day you're working on: `lune run prepare.luau -- --day N`
    - You can also set the year that will be used (defaults to current year) by setting an environment variable named `AOC_YEAR`
5. Write your solution in the new `years/{year}/{day}/solution.luau`
6. Run the solve script for the day with `lune run solve.luau -- -d N --input-file {path}`
    - Can also omit the `--input-file` argument if you set the `AOC_SESSION_COOKIE` environment variable
