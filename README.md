# Sequence-Recognition
## Description
This module allows you to control an output command.

It is composed of 3 inputs :
- X, 
- Y, 
- hor (the clock signal).

The clock is supposed to have a very high frequency compared to the inputs' variations as can be seen on the figure below.

The S output is activated (positive logic) unless when the represented sequence is detected.

The S output is reactivated if X goes to '0' or Y goes to '1'.

This module was made using an FSM.

## Transition between states

| #  | state  | state  |    Condition    |
|----|--------|--------|-----------------|
| 1  | state0 | state0 | (!x) + (x).(y)  |
| 2  | state0 | state1 | (x).(!y)        |
| 3  | state1 | state1 | (!x).(y) + (x)  |
| 4  | state1 | state2 | (!x).(!y)       |
| 5  | state2 | state2 | (!x).(!y) + (x) |
| 6  | state2 | state3 | (!x).(y)        |
| 7  | state3 | state3 | (!x).(y) + (x)  |
| 8  | state3 | state4 | (!x).(!y)       |
| 9  | state4 | state5 | (x).(!y)        |
| 10 | state4 | state4 | (!x) + (x).(y)  |
| 11 | state5 | state6 |                 |
| 12 | state6 | state0 | (!x) + (x).(y)  |
| 13 | state6 | state6 | (x).(!y)        |




## State machine view
This is a very simple view that I took from the State Machine Viewer tool from Quartus Prime.

<img width="1151" height="365" alt="image" src="https://github.com/user-attachments/assets/c33b767f-ffe1-4e61-9c5d-5aad06c0871e" />



## Timing diagram

<img width="632" height="175" alt="image" src="https://github.com/user-attachments/assets/5eecfaa2-d89f-48be-8b1e-5cdc490b622b" />



 
