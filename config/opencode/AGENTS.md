# Plans
- At the end of each plan, give me a list of unresolved questions to answer, if any. Make the questions extremely concise. Sacrifice grammar for the sake of concision.

# Code Style
- Write the simplest correct implementation. No more.
- Do not add defensive nil/error checks for conditions the type system or caller guarantees.
- No comments on obvious code. Comments explain *why*, not *what*.
- Do not extract one-use helpers. Inline unless used ≥2 times.
- Do not create new types unless grouping data or implementing an interface.
- Do not add input validation beyond existing patterns for the same thing.

# MCPs
- If you are unsure how to do something, use `grep-app` to search code examples from GitHub.
- When you need to search docs, use `context7` tools.
