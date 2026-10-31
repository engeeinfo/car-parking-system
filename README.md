# Car Parking System

Verilog RTL for a simple parking-slot controller.

## Files

- `park.v` - controller implementation
- `park_tb.v` - simulation testbench
- `parking.png` - design illustration

## Simulate

```bash
iverilog -o parking_tb park.v park_tb.v
vvp parking_tb
```