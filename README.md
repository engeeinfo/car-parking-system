# FPGA Car Parking System

Verilog parking controller with entrance/exit sensors, password validation,
LED status outputs, and two seven-segment display outputs.

## Requirements

- Icarus Verilog 11 or newer
- `make`

Run the existing scenario:

```sh
make test
```

The testbench covers reset, entry, password input, exit, an incorrect
password, and restart. It is currently a smoke test with waveform/monitor
output rather than exhaustive assertions.

## Structure

- `park.v` contains the controller and seven-segment decoding logic.
- `park_tb.v` contains the simulation scenario.
- `docs/ARCHITECTURE.md` describes module boundaries.
- `docs/MODERNIZATION.md` records the baseline and audit.
