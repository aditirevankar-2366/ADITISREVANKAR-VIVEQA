## FPGA Input Mapping

| **FPGA Input** | **Function** |
|:--------------:|--------------|
| Clock | 24 MHz System Clock |
| SW0 | Brake |
| SW1 | Overspeed |
| SW2 | Airbag Deployment |
| SW3 | Collision |
| SW4 | Engine Start |
| SW5 | Engine Stop |
| SW6 | System Reset |


## FPGA Output Mapping

| **FPGA Output** | **Function** |
|:---------------:|--------------|
| LED0–LED2 | Event ID (Binary) |
| LED3 | Event Valid Indicator |
| LED4 | Memory Write Enable (`wr_en`) |
| LED5 | Reset Status |
| LED6 | Unused / Reserved |
| LED7 | Timestamp Heartbeat |
| UART TX | Transmits Logged Events to PuTTY |

## HARDWARE RESULTS

#### BRAKE 

<img width="462" height="270" alt="image" src="https://github.com/user-attachments/assets/1224b1f2-c0b6-469b-8d1a-b32670c2cd50" />


#### OVERSPEED

<img width="453" height="285" alt="image" src="https://github.com/user-attachments/assets/98c7f3a9-87f7-477f-910b-5a07e3d090d0" />

#### AIRBAG

<img width="478" height="273" alt="image" src="https://github.com/user-attachments/assets/1c727f4d-8cad-4867-a838-bea51c0ba844" />

#### ENGINE START

<img width="452" height="273" alt="image" src="https://github.com/user-attachments/assets/afafc52e-eed2-4cae-8410-df2175e7cf4b" />

#### ENGINE STOP 

<img width="442" height="264" alt="image" src="https://github.com/user-attachments/assets/5375a0d2-4527-4983-bb6b-15fb1c594751" />

#### COLLISION

<img width="478" height="275" alt="image" src="https://github.com/user-attachments/assets/5a16deaa-566d-4759-b348-cf7ff29de772" />
