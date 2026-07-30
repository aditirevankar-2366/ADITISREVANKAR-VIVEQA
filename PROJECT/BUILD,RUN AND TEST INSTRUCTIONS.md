# Build, Run, and Testing Instructions

## Build Instructions

1. Clone or download this repository.
2. Open **Xilinx Vivado Design Suite**.
3. Create a new RTL project or open the existing project.
4. Add all Verilog source files located in the `src/` directory.
5. Add the XDC constraints file.
6. Set `vehicle_blackbox_top` as the **Top Module**.
7. Run the following stages:
   - **Synthesis**
   - **Implementation**
   - **Generate Bitstream**

---

## Run Instructions

1. Connect the **Artix-7 FPGA** board to the computer using the USB programming cable.
2. Open **Hardware Manager** in Vivado.
3. Program the FPGA with the generated bitstream (`.bit`) file.
4. Connect the FPGA UART port to the computer.
5. Open **PuTTY** and configure the serial connection:
   - **Baud Rate:** 9600 bps
   - **Data Bits:** 8
   - **Parity:** None
   - **Stop Bits:** 1
6. Press the designated push button to transmit the stored event logs to PuTTY.

---

## Hardware Testing

1. Press the **Reset** switch to initialize the system.
2. Trigger vehicle events using the FPGA switches:
   - Brake
   - Overspeed
   - Collision
   - Airbag
   - Engine Start
   - Engine Stop
3. Observe the LEDs to verify:
   - Event ID
   - Event Valid
   - Write Enable
   - Timestamp Heartbeat
4. Verify that events are stored correctly in memory.
5. Press the UART transmission button to display the logged events on **PuTTY**.

---

## Simulation Testing

Each module was verified independently using dedicated Verilog testbenches before system integration.

The following modules were simulated:

- Timestamp Counter
- Event Encoder
- Logger FSM
- Log Memory
- Read Pointer
- Read Controller
- UART Controller
- UART Transmitter

The complete system was then integrated and validated on the Artix-7 FPGA.
