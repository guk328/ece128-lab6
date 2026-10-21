ECE128 Lab 6 - FSMs and Debouncer

Names: Madeline Grassi, Guranaad Kaur

Date: 10/16/2026

Project description: This lab implements a switch debouncer and two finite state machine sequence detectors in Verilog (Moore sequence 1100 and Mealy overlapping sequence 1101). The designs were simulated in Vivado, and the debouncer was then implemented during lab using a Basys 3 FPGA board. A push button is used as the input and an LED is used as the output.

Instructions for simulation:
1. Open Vivado and create a new project.
2. Add the design files debouncer.v, moore.v, and mealyoverlapping.v into the project where it is labeled “Sources”.
3. Add the testbenches debouncer_tb.v, moore_tb.v, and mealyoverlapping_tb.v where it is labeled “Simulation Sources”. Set the testbench you want to run as the top module in “Simulation Sources” (right click it and choose “Set as Top”).
4. For the debouncer simulation, use a shortened 3-bit counter (reg[2:0] counter and TC = 3'b111) so the output changes after 8 clock cycles. The full 25-bit counter is too long to simulate.
5. Run the simulation, and select “Run Behavioral Simulation” when prompted.
6. A waveform will be generated and appear on screen. Observe the results for correctness.

Instructions for FPGA implementation:
1. Create a constraints file (the Basys-3-Master.xdc file is provided in Google Drive). Assign RAW to the center push button, CLK to the board's clock, and CLEAN to LED0.
2. Change the debouncer back to the full 25-bit counter version (reg[24:0] counter and TC = 25'h1FFFFFF).
3. In Vivado, run the Synthesis, then Implementation, then generate the bitstream.
4. Connect the Basys 3 board provided during lab using USB, then open the Hardware Manager.
5. Click “Program Device” and select the .bit file.
6. Once the programming is complete, the board will stop blinking and produce the expected output. Test by pressing and holding the center button. LED0 should turn on after a short amount of time and turn off when the button is released. Quickly tapping the button should not work.
