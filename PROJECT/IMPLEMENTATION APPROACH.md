## Implementation Approach

The **Vehicle Black Box Event Logger** was developed using a **modular bottom-up design methodology** in **Verilog HDL**. Each module was designed, simulated, and verified independently before being integrated into the top-level system. The complete design was synthesized and implemented on a **Xilinx Artix-7 FPGA** using **Vivado Design Suite**.

The implementation follows these stages:

1. **Timestamp Generation**
   - A **16-bit Timestamp Counter** continuously generates timestamps for every logged vehicle event.

2. **Event Detection**
   - The **Event Encoder** monitors six vehicle events:
     - Engine Start
     - Engine Stop
     - Brake
     - Overspeed
     - Collision
     - Airbag Deployment
   - Each event is assigned a unique **Event ID** and generates an **`event_valid`** signal.

3. **Logging Control**
   - A **Logger FSM** validates detected events and generates a single **Write Enable (`wr_en`)** pulse, ensuring each event is logged only once.

4. **Memory Management**
   - A **Write Pointer** stores events sequentially in a **16 × 32-bit Log Memory**, with each entry containing the timestamp and corresponding Event ID.

5. **Log Retrieval**
   - A **Read Pointer** and **Read Controller** retrieve stored events sequentially, while an **Entry Counter** tracks the number of valid log entries.

6. **Button Debouncing**
   - A **Debounce** module filters switch bouncing and generates a single clean pulse for each push-button press.

7. **UART Communication**
   - A **UART Controller** and **UART Transmitter** convert stored log data into serial format for transmission to a PC terminal such as **PuTTY**, enabling real-time viewing of logged events.

8. **System Integration & Testing**
   - All modules are integrated in the **`vehicle_blackbox_top`** module and verified through **Verilog testbenches**, **Vivado simulation**, and **hardware implementation** on the FPGA.
