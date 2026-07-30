**DESIGN AND ARCHITECTURE**

The **Vehicle Black Box Event Logger** is designed using a **modular architecture**, where each module performs a dedicated function and communicates with other modules through well-defined interfaces. This approach improves **scalability**, simplifies **debugging**, and allows individual modules to be tested independently before system integration.

The system begins with the **Timestamp Counter**, which continuously generates a **16-bit timestamp** used to record the exact time at which an event occurs. Vehicle events such as **Engine Start**, **Engine Stop**, **Braking**, **Overspeeding**, **Collision**, and **Airbag Deployment** are monitored by the **Event Encoder**, which assigns a unique **Event ID** and generates an **event_valid** signal whenever a valid event is detected.

The **Logger Finite State Machine (FSM)** controls the event logging process. It receives the **event_valid** signal and generates a single **Write Enable (`wr_en`)** pulse, ensuring that each event is logged only once. The **Write Pointer** maintains the memory address for storing successive events, while the **Log Memory** stores each event as a **32-bit data word** consisting of the **timestamp**, **Event ID**, and **reserved bits** for future expansion.

For retrieving stored logs, the **Read Pointer** sequentially generates memory addresses, and the **Read Controller** extracts the **timestamp** and **Event ID** from each memory location. An **Entry Counter** keeps track of the number of valid events stored, allowing the system to transmit only meaningful records.

To ensure reliable hardware operation, a **Debounce** module filters **mechanical button noise** and generates a **single pulse** for each button press. Finally, the **UART Controller** and **UART Transmitter** convert the stored event data into **serial data** and transmit it to a computer terminal such as **PuTTY**, enabling real-time visualization of the logged vehicle events.

The complete system is integrated in the **`vehicle_blackbox_top`** module, which instantiates all functional blocks, connects them through internal **control** and **data signals**, and interfaces with the **FPGA switches**, **LEDs**, **clock**, and **UART output**. This **hierarchical architecture** ensures efficient operation, modular development, and provides a scalable foundation for future enhancements such as **event priority handling**, **event statistics**, and **external memory support**.

## Vehicle Black Box Event Logger Architecture

```text
                    VEHICLE INPUTS
     Brake | Overspeed | Collision | Airbag | Engine Start | Engine Start 
                       │
                       ▼
               +------------------+
               |  Event Encoder   |
               +------------------+
                        │
          Event ID + Event Valid
                        │
                        ▼
               +------------------+
               |    Logger FSM    |
               +------------------+
                        │
                   Write Enable
                        │
        ┌───────────────┴──────────────┐
        │                              │
        ▼                              ▼
+------------------+          +------------------+
| Timestamp Counter|          |  Write Pointer   |
+------------------+          +------------------+
        │                              │
        └───────────────┬──────────────┘
                        ▼
               +----------------------+
               |      Log Memory      |
               |     (16 × 32-bit)    |
               +----------------------+
                        │
                        ▼
               +------------------+
               |   Read Pointer   |
               +------------------+
                        │
                        ▼
               +------------------+
               | Read Controller  |
               +------------------+
                        │
                        ▼
               +------------------+
               |  Entry Counter   |
               +------------------+
                        │
                        ▼
               +------------------+
               | UART Controller  |
               +------------------+
                        │
                        ▼
               +------------------+
               | UART Transmitter |
               +------------------+
                        │
                        ▼
                  PuTTY Terminal

        Push Buttons
             │
             ▼
      +---------------+
      |   Debounce    |
      +---------------+
             │
             └────────────► UART Controller
```

<img width="1122" height="1402" alt="image" src="https://github.com/user-attachments/assets/e2530347-1e38-42a9-b0b6-5eabda5c464f" />
