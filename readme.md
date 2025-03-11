to start a new project in cairo use 

```cairo
scrab new name
```

To build a project you use 
```cairo
scarb build
```

To format a project use 
Cairo style is to indent with four spaces, not a tab.

```cairo
scarb fmt
```

To run a cairo project

```cairo
scarb cairo-run
```

-p prime_prover specifies the package name (matches Scarb.toml).
--print-program-output displays the result.
--arguments the argument the excute entry point takes to run.


we can use consteval_int! to calculate and get computatiional result
