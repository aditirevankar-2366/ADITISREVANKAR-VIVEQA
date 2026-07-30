Project Overview

The **Vehicle Black Box Event Logger** is an **FPGA-based embedded system** developed in **Verilog HDL** on a **Xilinx Artix-7 FPGA**. The project is designed to monitor important vehicle events, assign them unique event IDs, timestamp them, and store them in on-chip memory for later retrieval.

The system follows a modular architecture consisting of a Timestamp Counter, Event Encoder, Logger Finite State Machine (FSM), Write Pointer, Log Memory, Read Pointer, Read Controller, Entry Counter, Debounce Circuit, UART Controller, and UART Transmitter, all integrated through a single top-level module.

When an event such as braking, overspeeding, collision, or airbag deployment is detected, the Event Encoder generates a corresponding event ID. The Logger FSM validates the event and generates a write enable signal, allowing the timestamp and event ID to be stored sequentially in a 16 × 32-bit log memory. The Write Pointer manages memory addresses during logging, while the Entry Counter tracks the number of valid events stored.

For log retrieval, the Read Pointer and Read Controller sequentially access the stored records. The UART Controller and UART Transmitter are used to transmit the logged events serially to a computer terminal such as PuTTY, enabling real-time visualization of recorded vehicle events. A Debounce module ensures reliable push-button operation by eliminating switch bouncing and generating clean input pulses.

The project demonstrates the implementation of digital system design, finite state machines, memory management, UART communication, and FPGA-based hardware validation, making it a practical prototype of an automotive Event Data Recorder (EDR) and a strong demonstration of FPGA and embedded systems design.
