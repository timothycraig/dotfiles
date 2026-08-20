# CLAUDE.md

## Surgical Changes

Touch only what you must.

- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- If you notice unrelated dead code, mention it - don't delete it.
- Do remove imports/variables/functions that *your* changes made unused.

Every changed line should trace directly to the request.

## Simplicity

- No abstractions for single-use code.
- No error handling for impossible scenarios.
- No configurability that wasn't requested.

## Verify

Turn tasks into checks: "fix the bug" -> write a test that reproduces it, then make it pass.
