<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project implements a Finite Impulse Response (FIR) filter in Verilog, designed to process digital signals. The filter operates as follows:

- Inputs:
  - `ui_in`: The digital input signal to be filtered.
  - `clk`: The clock signal for synchronization.
  - `rst_n`: An active-low reset signal.
  - `ena`: An enable signal for activating the filter.

- Outputs:
  - `uo_out`: The primary filtered output signal.
  - `uio_out`: A secondary output for additional processed results.

- Processing:
  - The FIR filter uses a predefined set of coefficients to multiply and sum the incoming samples, producing a filtered output.
  - The design is pipelined for efficiency, allowing multiple stages to operate in parallel.

- Testing:
  - The filter is tested using a Cocotb-based testbench. Various input scenarios, including edge cases like zero and maximum values, are applied and validated against expected results.

## How to test

Follow these steps to test the FIR filter:

1. Setup:
   - Install required dependencies like `cocotb` and `iverilog`.
   - Ensure the project files (`project.v`, `tb.v`, and `test.py`) are in their respective directories.

2. Run the Simulation:
   - Execute the simulation using the `make` command:
     ```bash
     make -f Makefile results.xml
     ```
   - This command compiles the Verilog code, runs the testbench, and generates a results file (`results.xml`).

3. Analyze the Results:
   - Check the simulation logs for detailed output.
   - Use the `results.xml` file to verify that all test cases pass.

4. Debugging:
   - Review any failed test cases in the logs or results file.
   - Ensure the actual output matches the expected behavior of the filter.

## External hardware

This project is primarily a digital design and does not require external hardware for simulation. However, if deployed on an FPGA, the following components may be used:

- Input Sources:
  - ADC (Analog-to-Digital Converter) for real-world input signals.
  - PMOD or GPIO interfaces for external input.

- Output Devices:
  - LED display or PMOD for visualizing the output.
  - DAC (Digital-to-Analog Converter) to reconstruct the filtered signal.

- Test Equipment:
  - Oscilloscope or signal analyzer to validate the filter output.
