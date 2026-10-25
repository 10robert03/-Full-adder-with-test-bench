# Full Adder in Verilog

This is my first step into hardware description languages and digital chip design.

Coming from embedded systems, where I mostly program existing microcontrollers, I want to learn how the hardware itself is designed. This repository starts small: a 4-bit full adder and a self-written testbench that checks all 512 input combinations.

I'm working through *Digital Design and Computer Architecture* (RISC-V Edition) by Harris & Harris alongside these projects. The longer-term goal is to design and tape out my own small chip through Tiny Tapeout.

## Files

- `fulladder.v` – the full adder module
- `tb_fulladder.v` – testbench for the 1 bit adder that drives all input combinations and checks the outputs
- `tb_adder4.v` – testbench for the 4 bit adder that drives all input combinations and checks the outputs

## Running the simulation

Requires [Icarus Verilog](https://github.com/steveicarus/iverilog).

```bash
iverilog -o sim.vvp tb_fulladder.v fulladder.v
vvp sim.vvp
```

## Tools

- Icarus Verilog (simulation)
- GTKWave (waveform viewer)
- Verilator (linting)
