# Modernization record

## Baseline

Baseline captured on 2026-10-31 from `main`.

| Area | Result | Notes |
| --- | --- | --- |
| Stack | Verilog | Controller and one simulation testbench. |
| Build | Pass | Icarus compiles the design. |
| Tests | Smoke test | Scenario covers reset, entry, exit, wrong password, and restart but uses no assertions. |
| Lint | Missing | No HDL quality gate existed. |
| License | Missing | Added MIT license. |
| CI | Missing | Added simulation workflow. |

## Audit findings

1. **Medium — weak verification:** the testbench monitors outputs but does not
   assert expected acceptance/rejection behavior.
2. **Low — undocumented polarity:** reset and sensor semantics were not
   documented.
3. **Low — missing project contract:** setup and module responsibilities were
   undocumented.

No secrets or external dependency vulnerabilities were found.

## Changes

Added documentation, Makefile build/lint/test targets, CI, standard ignore
rules, and an MIT license. Existing controller behavior and ports were
preserved. Assertions for the state machine are documented as follow-up work
because expected board-level timing and display semantics should be confirmed
first.
