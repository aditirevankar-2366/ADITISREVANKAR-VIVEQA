# Future Enhancements

The current implementation provides a functional FPGA-based vehicle event logger. The following enhancements can further improve the system and make it more representative of an automotive Event Data Recorder (EDR):

### Engine State Monitoring
- Introduce an **Engine State Controller** to maintain the engine's ON/OFF status.
- Enable event logging only when the engine is running, preventing false event detection when the vehicle is switched off.

### Seat Belt Detection with Buzzer
- Integrate a **Seat Belt Detection** module with an audible buzzer.
- If the engine is ON and the seat belt is not fastened, the buzzer will remain active until the seat belt is engaged, simulating a real vehicle safety feature.

### Event Statistics Counter
- Implement an **Event Statistics Counter** to record the number of occurrences of each event type (Brake, Overspeed, Collision, Airbag, Engine Start, and Engine Stop).
- Display the event statistics through UART on **PuTTY**, providing a summary of vehicle activity in addition to the chronological event log.

### External Memory Support
- Replace the on-chip **16 × 32-bit log memory** with external Flash memory or an SD card to significantly increase logging capacity and support long-duration event recording.

### Advanced Event Prioritization
- Introduce configurable event prioritization to handle multiple simultaneous vehicle events and ensure that critical events are processed first.

### Enhanced UART Interface
- Extend the UART interface to support user-selectable modes for viewing **individual event logs**, **event statistics**, and **system status** directly on PuTTY.
