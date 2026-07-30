# Module Descriptions

## 1. Timestamp Counter (`timestamp_counter.v`)
The **Timestamp Counter** generates a continuously incrementing **16-bit timestamp** synchronized with the system clock. Every logged vehicle event is associated with this timestamp, enabling chronological reconstruction of vehicle activity.

**Function:**
- Generates a 16-bit timestamp.
- Resets to zero on system reset.
- Provides the time reference for every logged event.

---

## 2. Event Encoder (`event_encoder.v`)

The **Event Encoder** monitors the vehicle inputs and assigns a unique **3-bit Event ID** to each detected event. Whenever a valid event is detected, the module generates an **`event_valid`** signal, which initiates the logging process.

### Event ID Mapping

| Vehicle Event | Event ID |
|---------------|----------|
| Brake | `001` |
| Overspeed | `010` |
| Airbag Deployment | `011` |
| Engine Start | `100` |
| Engine Stop | `101` |
| Collision | `110` |

**Function:**
- Detects vehicle events.
- Assigns a unique 3-bit Event ID.
- Generates the `event_valid` signal.
- Passes the encoded event information to the Logger FSM for storage.
## 3. Logger FSM (`logger_FSM.v`)
The **Logger Finite State Machine (FSM)** controls the event logging process. It ensures that each valid event is recorded only once by generating a single **Write Enable (`wr_en`)** pulse.

**States:**
- IDLE
- LOG
- DONE

**Function:**
- Controls memory write operation.
- Prevents duplicate logging.
- Coordinates event storage.

---

## 4. Write Pointer (`write_pointer.v`)
The **Write Pointer** manages the address of the next memory location available for storing a new event.

**Function:**
- Generates write addresses.
- Increments after every successful log.
- Supports sequential memory storage.

---

## 5. Log Memory (`log_memory.v`)
The **Log Memory** stores the logged vehicle events.

Each memory location stores:

- 16-bit Timestamp
- Event ID
- Reserved bits for future expansion

**Memory Organization**
- 16 Entries
- 32-bit Width

**Function:**
- Stores event records.
- Preserves chronological event information.

---

## 6. Read Pointer (`read_pointer.v`)
The **Read Pointer** generates sequential addresses for retrieving stored events from memory.

**Function:**
- Starts reading from Address 0.
- Increments after every read operation.
- Supports sequential log retrieval.

---

## 7. Read Controller (`read_controller.v`)
The **Read Controller** reads data from log memory and separates the stored memory word into individual fields.

**Function:**
- Extracts Timestamp.
- Extracts Event ID.
- Sends formatted data to the UART Controller.

---

## 8. Entry Counter (`entry_counter.v`)
The **Entry Counter** keeps track of the number of valid events stored in log memory.

**Function:**
- Counts successful memory writes.
- Prevents reading unused memory.
- Indicates the number of valid log entries available for transmission.

---

## 9. Debounce (`debounce.v`)
Mechanical push buttons produce multiple unwanted transitions during a single press. The **Debounce** module filters these transitions and generates one clean pulse for each button press.

**Function:**
- Eliminates button bounce.
- Generates a single clean pulse.
- Ensures reliable button operation.

---

## 10. UART Controller (`uart_controller.v`)
The **UART Controller** coordinates the complete transmission of stored vehicle logs to the serial interface. It retrieves data from memory, controls the read sequence, and sends formatted characters to the UART Transmitter.

**Function:**
- Controls UART transmission sequence.
- Reads log entries sequentially.
- Interfaces with the Read Controller.
- Controls transmission timing.
- Stops transmission after all valid entries are sent.

---

### 10.1 Binary to ASCII Converter (`bin2ascii.v`)
The **Binary-to-ASCII Converter** converts binary numerical values into their corresponding ASCII characters before transmission.

For example:

- Binary `5` → ASCII `'5'`
- Binary `12` → ASCII `"12"`

**Function:**
- Converts timestamps into printable characters.
- Enables readable numerical output in PuTTY.

---

### 10.2 Event ASCII Converter (`event_ascii.v`)
The **Event ASCII Converter** converts each Event ID into a human-readable event name.

Example mappings:

| Event ID | UART Output |
|----------|-------------|
| 001 | BRAKE |
| 010 | OVERSPEED |
| 011 | COLLISION |
| 100 | AIRBAG |
| 101 | ENGINE START |
| 110 | ENGINE STOP |

**Function:**
- Converts Event IDs into text.
- Improves readability of UART output.
- Displays descriptive event names in PuTTY.

---

## 11. UART Transmitter (`uart_transmitter.v`)
The **UART Transmitter** converts parallel ASCII data into serial data following the UART protocol and transmits it to the computer terminal.

**Function:**
- Serializes ASCII characters.
- Generates UART frames.
- Transmits data to PuTTY through the FPGA UART interface.

---

## 12. Top Module (`vehicle_blackbox_top.v`)
The **Top Module** integrates all functional blocks of the Vehicle Black Box Event Logger into a single FPGA design. It connects the event detection, logging, memory, and UART subsystems while interfacing with the FPGA clock, switches, LEDs, and serial output.

**Function:**
- Instantiates all project modules.
- Routes control and data signals.
- Interfaces with FPGA hardware.
- Implements the complete Vehicle Black Box Event Logger.
