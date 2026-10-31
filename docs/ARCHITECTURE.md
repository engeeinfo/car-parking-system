# Architecture

```text
park
├── parking controller FSM
└── seven-segment output decoder
```

`park` owns sensor sampling, password state, occupancy/status decisions, and
display encoding. A future board wrapper should connect physical sensors and
pins without changing the controller's state logic.

The current interface uses active-low reset and two-bit password digits. LED
outputs indicate the controller status; display outputs expose the current
password/state indication.
