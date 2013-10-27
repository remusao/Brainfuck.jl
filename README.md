# Brainfuck

## Install

```julia
Pkg.clone("https://github.com/remusao/Brainfuck.jl.git")
Pkg.update()
```

## Usage

```julia
using Brainfuck

# Default memory size is 30000
brainfuck("myprogram.bf")

# Customize memory size
brainfuck("myprogram.bf", 5000)
```
