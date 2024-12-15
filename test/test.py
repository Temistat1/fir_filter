import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_fir_filter(dut):
    """Test the FIR filter."""

    # Generate clock
    clock = Clock(dut.clk, 10, units="ns")  # 10 ns clock period
    cocotb.start_soon(clock.start())

    # Initialize input signals
    dut.rst_n.value = 0
    dut.ena.value = 0
    dut.ui_in.value = 0
    dut.uio_in.value = 0

    # Apply reset
    await RisingEdge(dut.clk)
    dut.rst_n.value = 1

    # Wait for a few clock cycles
    for _ in range(5):
        await RisingEdge(dut.clk)

    # Test sequence: Apply enable signal and varying inputs
    dut.ena.value = 1

    # Test case 1: Basic functionality
    test_inputs = [10, 20, 30, 40, 50, 60, 70, 80]  # Example input values
    expected_outputs = [0] * len(test_inputs)  # Replace with actual expected outputs

    for i, test_input in enumerate(test_inputs):
        dut.ui_in.value = test_input

        await RisingEdge(dut.clk)

        # Capture output after the clock edge
        output = dut.uo_out.value
        uio_output = dut.uio_out.value

        # Optional: Print debug information
        dut._log.info(f"Cycle {i}: Input={test_input}, Output={int(output)}, UIO Output={int(uio_output)}")

        # Add your output validation logic here
        assert int(output) == expected_outputs[i], f"Test failed at cycle {i}: Expected {expected_outputs[i]}, got {int(output)}"

    dut._log.info("Test case 1 completed successfully!")

    # Test case 2: Edge case with zeros
    test_inputs = [0, 0, 0, 0, 0, 0, 0, 0]
    expected_outputs = [0] * len(test_inputs)

    for i, test_input in enumerate(test_inputs):
        dut.ui_in.value = test_input

        await RisingEdge(dut.clk)

        output = dut.uo_out.value
        dut._log.info(f"Edge Test {i}: Input={test_input}, Output={int(output)}")
        assert int(output) == expected_outputs[i], f"Edge Test failed at cycle {i}: Expected {expected_outputs[i]}, got {int(output)}"

    dut._log.info("Test case 2 completed successfully!")

    # Test case 3: Maximum value inputs
    test_inputs = [255, 255, 255, 255, 255, 255, 255, 255]
    expected_outputs = [255] * len(test_inputs)  # Adjust based on FIR behavior

    for i, test_input in enumerate(test_inputs):
        dut.ui_in.value = test_input

        await RisingEdge(dut.clk)

        output = dut.uo_out.value
        dut._log.info(f"Max Test {i}: Input={test_input}, Output={int(output)}")
        assert int(output) == expected_outputs[i], f"Max Test failed at cycle {i}: Expected {expected_outputs[i]}, got {int(output)}"

    dut._log.info("Test case 3 completed successfully!")

    dut._log.info("All test cases completed successfully!")
