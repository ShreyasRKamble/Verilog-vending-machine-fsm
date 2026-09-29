# 🥤 Verilog Vending Machine FSM

A Moore Finite State Machine (FSM) implementation of a vending machine using **Verilog HDL**. The machine accepts coin inputs, tracks the accumulated amount through state transitions, dispenses the product when the required amount is reached, and returns change whenever applicable.

---

## 📌 Project Overview

This project demonstrates the implementation of a vending machine controller using a **Mealy FSM**. The controller transitions through different states based on the inserted coins and generates output signals only from the current state.

The design was developed as a digital design practice project to strengthen concepts such as:

- Finite State Machines (FSM)
- Sequential Logic
- Verilog HDL
- RTL Design
- Testbench Development

---

## ✨ Features

- Moore FSM implementation
- Verilog HDL based RTL design
- Product dispensing logic
- Change return logic
- Synchronous design with clock
- Active-high reset
- Complete Verilog testbench
- Easy to simulate in Quartus and ModelSim

---

## 📂 Project Structure

```
Verilog-vending-machine-fsm
│
├── vending_machine.v        # RTL Design
├── Vending_machine_tb.v     # Testbench
├── .gitignore
└── README.md
```

---

## ⚙️ Inputs

| Signal | Width | Description |
|---------|------:|-------------|
| `clk_i` | 1 | System Clock |
| `rst_i` | 1 | Active High Reset |
| `din_i` | 2 | Coin Input |

---

## 📤 Outputs

| Signal | Description |
|---------|-------------|
| `Pr_o` | Product Dispense Signal |
| `Re_o` | Return Change Signal |

---

## 🧠 FSM Overview

The vending machine is implemented as a **Moore Finite State Machine**, where outputs depend only on the current state.

The controller keeps track of the total amount inserted and moves between states accordingly. Once the required amount is collected:

- Product is dispensed.
- Change is returned if excess money has been inserted.
- The FSM returns to the initial state for the next transaction.

---

## 🔄 State Diagram

> <img width="1920" height="1080" alt="Screenshot 2026-07-23 192014" src="https://github.com/user-attachments/assets/bdcb9738-00b2-433b-881b-c532462d351b" />


---


## 🖥️ Simulation

The design has been verified using the provided testbench.

Simulation tools:

- Quartus Prime
- ModelSim

---

## 🚀 How to Run

1. Clone the repository.

```bash
git clone https://github.com/ShreyasRKamble/Verilog-vending-maching-fsm.git
```

2. Open the project in Quartus Prime.

3. Compile the RTL.

4. Run the testbench using ModelSim.

5. Observe the waveform and verify the FSM transitions.

---

## 📈 Future Improvements

- Support multiple products
- Multiple coin denominations
- LCD display interface
- Inventory management
- FPGA implementation

---

## 👨‍💻 Author

**Shreyas Kamble**

B.Tech Electronics Engineering

Walchand College of Engineering, Sangli

---

## 📄 License

This project is licensed under the MIT License.
