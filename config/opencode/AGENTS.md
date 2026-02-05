# Code Quality Standards
- Make minimal, surgical changes
- Abstractions: Consciously constrained, pragmatically parameterised, doggedly documented
- Make illegal states unrepresentable: Model domain with ADTs/discriminated unions; parse inputs at boundaries into typed structures; if state can't exist, code can't mishandle it

# Testing
- Write tests that verify semantically correct behavior
- Failing tests are acceptable when they expose genuine bugs and test correct behavior

# Plans
- At the end of each plan, give me a list of unresolved questions to answer, if any. Make the questions extremely concise. Sacrifice grammar for the sake of concision.

# MCPs
- If you are unsure how to do something, use `grep-app` to search code examples from GitHub.
- When you need to search docs, use `context7` tools.
