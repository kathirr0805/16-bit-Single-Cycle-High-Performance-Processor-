# 16-bit Single-Cycle High-Performance MIPS Processor

## Overview
This project presents the design and implementation of a 16-bit single-cycle MIPS processor in Verilog, developed as part of an internship under the guidance of Ms. Madhumitha (RTL Design Engineer) and Ms. Prasanthi Chanda (Design & Verification Engineer, Founder of ProV Logic). The processor executes instructions in a single clock cycle, supporting a subset of the MIPS instruction set, including arithmetic (ADD, SUB), logical (AND, OR, NOR), and memory (LW, SW) operations. It features a 16-bit data path, an 8-register file, an ALU optimized with a Carry-Lookahead Adder (CLA), hierarchical multiplexers for reduced delays, and a control unit for instruction execution. The project was simulated and verified using Xilinx Vivado, with testbenches ensuring functional correctness.

The project files, including Verilog source code, testbenches, and documentation, are hosted on Google Drive for easy access and collaboration.


## Features
- **Single-Cycle Execution**: Each instruction (fetch, decode, execute, memory access, write-back) completes in one clock cycle.
- **Instruction Set**: Supports R-type (ADD, SUB, AND, OR, NOR, SLT), I-type (ADDI, ANDI, ORI, LW, SW, BEQ, BNE, SLTI), and basic branch instructions.
- **Optimized ALU**: Uses a Carry-Lookahead Adder (CLA) for faster arithmetic operations.
- **Hierarchical Multiplexers**: Reduces critical path delays by breaking down large multiplexers into smaller ones.
- **Modular Design**: Components like Instruction Memory, Register File, ALU, Data Memory, Control Unit, and Sign Extension Unit are implemented as separate Verilog modules.
- **Simulation Ready**: Includes testbenches for functional verification in Xilinx Vivado.
- **Educational Focus**: Designed for learning computer architecture, digital logic design, and hardware-software co-design.

## Access Project Files
All project files, including Verilog source code, testbenches, Vivado project files, and documentation, are available on Google Drive:

[**Access Project Files on Google Drive**](https://drive.google.com/your-folder-link-here)

**Instructions to Access**:
1. Click the link above to open the Google Drive folder.
2. Ensure you are logged into a Google account with access (contact the owner if access is restricted).
3. Download or view files directly in the browser.
4. To contribute, request edit access from the folder owner or drag and drop files into the shared folder if permissions allow.

**Note**: The Google Drive folder is set to "Anyone with the link" for view access. For sensitive projects, adjust permissions to "Restricted" or specific email access for security.

## Requirements
### Software
- **Xilinx Vivado**: Used for Verilog design, simulation, synthesis, and implementation.
- **Verilog Compiler**: Supported by Vivado for HDL synthesis.
- **Simulation Tools**: Vivado Simulator or ModelSim for running testbenches.
- **Operating System**: Windows, Linux, or macOS (with Vivado installed).

### Hardware (for Simulation)
- A computer with sufficient resources to run Vivado (minimum 8 GB RAM, 20 GB disk space).

## Installation
1. **Download Project Files**:
   - Access the Google Drive link and download the project folder.
   - Ensure sufficient storage (Vivado project files can be large).
2. **Install Xilinx Vivado**:
   - Download and install Vivado from the Xilinx website (version compatible with your system, e.g., Vivado 2023.1 or earlier).
   - Ensure the Vivado license is properly configured.
3. **Set Up the Project in Vivado**:
   - Launch Vivado and select "Create Project."
   - Specify the project name and location, then select "RTL Project."
   - Add the Verilog source files (e.g., `instruction_memory.v`, `register_block.v`, `alu.v`, etc.) from the downloaded folder.
   - Add the testbench file (e.g., `MiniMIPS_testbench.v`) for simulation.
   - (Optional) Add a constraints file (.xdc) if targeting an FPGA for implementation.

## Usage
1. **Simulate the Processor**:
   - In Vivado, set up the simulation environment by selecting the testbench file.
   - Run the simulation to verify the processor's functionality.
   - Observe the waveform output to ensure:
     - The Program Counter (PC) increments correctly.
     - Instructions are fetched and decoded properly.
     - The ALU performs arithmetic/logical operations as expected.
     - Data Memory handles load/store operations correctly.
2. **Analyze Results**:
   - Review the simulation waveform to confirm functional correctness.
   - Check Vivado synthesis reports for resource utilization and timing analysis (if synthesized).
3. **Extend the Design**:
   - Modify the Verilog code to add new instructions or features.
   - Update the testbench to include additional test cases for new functionality.

## Project Structure
The project consists of the following key components, each implemented as a Verilog module:

- **Instruction Memory**: Stores 16-bit instructions, addressed by the Program Counter (PC).
- **Register File**: Contains 8 general-purpose 32-bit registers with two read ports (rs, rt) and one write port (rd).
- **Arithmetic Logic Unit (ALU)**: Performs operations like ADD, SUB, AND, OR, NOR, and SLT using a Carry-Lookahead Adder (CLA).
- **Data Memory**: Handles load (LW) and store (SW) operations with a 32-bit address space.
- **Control Unit**: Decodes instructions and generates control signals (e.g., reg_dest, alu_src, mem_write, reg_write, branch).
- **Sign Extension Unit**: Converts 6-bit immediate values to 32-bit for I-type instructions.

## Optimizations
- **Carry-Lookahead Adder (CLA)**: Reduces delay in ALU arithmetic operations by computing carry bits in parallel.
- **Hierarchical Multiplexers**: Breaks down large multiplexers into smaller 2:1 multiplexers to minimize critical path delays.
- **Single-Cycle Design**: Simplifies control logic, though it limits clock frequency due to the longest path delay.

## Results
- **Functional Correctness**: The processor successfully executes the supported MIPS instructions, verified through Vivado simulation.
- **Waveform Analysis**:
  - Correct PC incrementation.
  - Accurate instruction fetch and decode.
  - Proper ALU and memory operations.
- **Performance**:
  - Executes one instruction per clock cycle.
  - Latency: One clock cycle per instruction.
- **Power and Resource Utilization**: Detailed in the Vivado synthesis report (available in the project files).

## Future Enhancements
- **Pipelining**: Implement a multi-stage pipeline to improve throughput by overlapping instruction execution.
- **Extended Instruction Set**: Add support for multiplication, division, and floating-point operations.
- **Advanced Optimizations**: Explore out-of-order execution, superscalar architecture, or clock gating for power efficiency.
- **Peripheral Integration**: Add UART, GPIO, or timers to create a complete microcontroller system.
- **Machine Learning Support**: Extend the processor to support neural network accelerators for AI applications.

## Troubleshooting
- **Simulation Errors**: Ensure all Verilog files are correctly added to the Vivado project. Check for syntax errors in the code.
- **Waveform Issues**: Verify the testbench provides correct input stimuli. Ensure the simulation time is sufficient to observe all operations.
- **Vivado Setup**: Confirm Vivado is properly installed and licensed. Check for compatibility between Vivado version and your OS.

## Contributing
To contribute to this project:
1. Request edit access to the Google Drive folder.
2. Upload updated Verilog files, testbenches, or documentation to the appropriate subfolder.
3. Document changes in a changelog file or update this README.
4. Ensure compatibility with Vivado for consistency.

## License
This project is licensed under the MIT License.

## Acknowledgments
- **Ms. Madhumitha** and **Ms. Prasanthi Chanda** for their mentorship and guidance.
- Xilinx Vivado for providing a robust platform for design, simulation, and synthesis.
- The team members for their collaborative efforts in designing and verifying the processor.
