📌 Booth Multiplier Using Verilog (Final Year Project)
📁 Project Description
This project implements a signed Booth Multiplier using Verilog HDL and simulates it using Vivado Design Suite. The Booth algorithm is an efficient technique for multiplying signed binary numbers using fewer additions and subtractions.

🧠 Modules Included
booth_mul.v – Top-level wrapper that integrates all submodules

boothalgm.v – Implements Booth's multiplication algorithm and generates partial products

wallactreeee.v – Compresses partial products using Wallace Tree

fastadderrr.v – Final 32-bit adder using carry-lookahead logic

booth_mul_tb.v – Testbench for simulation and waveform analysis

⚙️ Features
Handles signed 16-bit inputs

Produces 32-bit signed product

Built-in Wallace Tree and CLA Adder for speed

Modular design, easy to extend or reuse

🧪 How to Simulate in Vivado
Open Vivado and create a new RTL project

Add all .v files (design + testbench)

Set booth_mul_tb.v as top module for simulation

Go to Flow Navigator → Run Simulation → Run Behavioral Simulation

Observe waveforms (product, multiplicand, multiplier) in the waveform viewer

🖥️ Sample Testcases (from testbench)
Multiplicand	Multiplier	Expected Product
5	3	15
-7	4	-28
-6	-8	48
32767	2	65534

📷 Screenshots (Optional)
Include:

RTL Schematic:<img width="1032" height="263" alt="image" src="https://github.com/user-attachments/assets/6d27e68e-dbf4-4f52-8cfa-e1138fee623f" />


Simulation waveform:<img width="1547" height="773" alt="image" src="https://github.com/user-attachments/assets/50ba494c-98e2-43f9-957d-2a631727de6a" />


🙋 About
This project was developed as part of the Final Year B.E Project in Electronics & Communication Engineering, focusing on Digital RTL Design using Verilog.

