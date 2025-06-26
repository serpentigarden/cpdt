From http://adam.chlipala.net/cpdt/.

Ideally, I would commit the starting state from the tarball extraction, which the diffs would speak for themselves, but I'm just committing the current state.

Notes 
* Not tracked changes: `elimtype` -> `elim`, `beq_nat` -> `Nat.eqb` 
* Using the VSCode extension (https://github.com/rocq-prover/vsrocq)
  * `ctrl + option + (up/down arrow)` to step through file
  * `ctrl + option + right arrow` to progress to cursor
* Manually compiling files with `coqc -R src Cpdt <file name>`.
  * `make` was constantly failing. `_CoqProject` does not seem to get picked up by `vscoqtop`, so the logical path `Cpdt` is not recognized.