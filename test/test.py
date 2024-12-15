# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import os
import subprocess

# Paths for Verilog files and output
rtl_file = "project.v"
tb_file = "tb.v"
output_file = "simulation_output.vcd"

def run_simulation():
    try:
        # Compile the Verilog files using Icarus Verilog
        compile_cmd = f"iverilog -o fir_core_tb {rtl_file} {tb_file}"
        subprocess.run(compile_cmd, shell=True, check=True)

        # Run the simulation and generate the VCD file
        run_cmd = f"vvp fir_core_tb"
        subprocess.run(run_cmd, shell=True, check=True)

        print(f"Simulation completed. Check {output_file} for waveform.")
    except subprocess.CalledProcessError as e:
        print(f"Error during simulation: {e}")

def main():
    if not os.path.exists(rtl_file):
        print(f"Error: {rtl_file} not found!")
        return

    if not os.path.exists(tb_file):
        print(f"Error: {tb_file} not found!")
        return

    run_simulation()

if __name__ == "__main__":
    main()

