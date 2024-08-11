---

# System Architecture Project: RISC-V Exception Handling

## Table of Contents
1. [Project Overview](#project-overview)
2. [Project Setup](#project-setup)
3. [Project Structure](#project-structure)
4. [Task Descriptions](#task-descriptions)
   - [Task 1: System Calls](#task-1-system-calls)
   - [Task 2: Timer Interrupt](#task-2-timer-interrupt)
   - [Task 3: External Interrupt](#task-3-external-interrupt)
   - [Task 4: CSR Instructions](#task-4-csr-instructions)
   - [Task 5: Bonus Task - Real-Time Clock](#task-5-bonus-task-real-time-clock)
5. [Testing and Debugging](#testing-and-debugging)
6. [Submission Guidelines](#submission-guidelines)
7. [Collaboration Policy](#collaboration-policy)
8. [Additional Resources](#additional-resources)

---

## Project Overview

This project is part of the System Architecture course for the Summer Semester 2024. The primary focus is on understanding and implementing system programming concepts within the RISC-V architecture. Specifically, this project involves working with exception handling mechanisms, including system calls, timer interrupts, and external device interrupts.

You will interact directly with Control and Status Registers (CSRs), write assembly code, and manage machine mode execution to handle various exceptions. The project will deepen your understanding of low-level system operations and the architecture of RISC-V processors.

## Project Setup

### Prerequisites
- **Docker**: To set up a RISC-V simulator environment.
- **RISC-V GNU Toolchain**: For compiling assembly code.
- **Make**: For managing the build process.

### Installation Instructions

1. **Set Up the RISC-V Simulator**
   - Install Docker by following the instructions for your operating system [here](https://docs.docker.com/get-docker/).
   - Pull the RISC-V Docker image:
     ```bash
     docker pull riscv/riscv-tools
     ```
   - Start the Docker container:
     ```bash
     docker run -it --name riscv-sim riscv/riscv-tools
     ```
   - Access the container’s shell:
     ```bash
     docker exec -it riscv-sim bash
     ```

2. **Clone the Project Repository**
   ```bash
   git clone https://gitlab.cs.uni-saarland.de/reineke/sysarch-project-two
   cd sysarch-project-two
   ```

3. **Build the Project**
   - Use the provided Makefile to build your code:
     ```bash
     make all
     ```

## Project Structure

The project is organized into the following directories:

- **`src/`**: Contains the source code files, including assembly files for each task.
- **`include/`**: Header files with definitions and macros used across the project.
- **`test/`**: Test scripts and sample input files.
- **`Makefile`**: The Makefile to compile and run the project.
- **`README.md`**: This README file.

## Task Descriptions

### Task 1: System Calls

**Objective**: Implement system call handling in machine mode. System calls are initiated by user programs and require the processor to switch to machine mode to handle the request.

**Steps**:
- Modify the `mtvec` register to point to the system call handler.
- Implement the handler to process system calls using the `ecall` instruction.
- Return control to the user program after handling the system call.

**Expected Outcome**: The system should correctly process system calls and return appropriate responses to user programs.

### Task 2: Timer Interrupt

**Objective**: Implement a timer interrupt that triggers periodically to perform scheduled tasks.

**Steps**:
- Configure the `mtime` and `mtimecmp` CSRs to set up a periodic interrupt.
- Write an interrupt service routine (ISR) that handles the timer interrupt and increments a counter.
- Update the `mtvec` register to point to the timer interrupt handler.

**Expected Outcome**: The timer interrupt should trigger at regular intervals, and the counter should increment correctly.

### Task 3: External Interrupt

**Objective**: Handle external interrupts from a simulated peripheral device.

**Steps**:
- Configure the external interrupt source and enable it in the `mie` (Machine Interrupt Enable) register.
- Implement an ISR to handle the external interrupt and perform the required operations (e.g., reading data from the peripheral).
- Test the ISR by simulating an external interrupt.

**Expected Outcome**: The system should correctly handle external interrupts and execute the appropriate ISR.

### Task 4: CSR Instructions

**Objective**: Implement and test various CSR (Control and Status Register) instructions that are critical for managing exceptions and interrupts.

**Steps**:
- Write assembly code to test the CSR instructions such as `csrrw`, `csrrs`, and `csrrc`.
- Ensure correct manipulation of CSRs like `mepc`, `mstatus`, and `mcause`.
- Validate the correct execution of CSR instructions through tests.

**Expected Outcome**: The CSR instructions should function as expected, correctly reading from and writing to the CSRs.

### Task 5: Bonus Task - Real-Time Clock

**Objective**: Implement a real-time clock (RTC) using the timer interrupt system.

**Steps**:
- Use the timer interrupt to increment the time stored in memory.
- Display the real-time clock on a connected terminal or output device.
- Ensure accurate timekeeping by adjusting the timer interrupt frequency.

**Expected Outcome**: The real-time clock should display the correct time, updating at regular intervals.

## Testing and Debugging

- Use the test scripts provided in the `test/` directory to validate your implementation.
- Run tests with:
  ```bash
  make test
  ```
- Debug using the `gdb` debugger available in the Docker container:
  ```bash
  riscv64-unknown-elf-gdb your-program
  ```

## Submission Guidelines

1. **Run All Tests**: Ensure all tests pass before submission.
2. **Create a Submission Archive**: Use the provided script or manually create a `.zip` file containing all relevant files.
3. **Submit via CMS**: Upload the `.zip` file to the CMS system by the deadline.

### Deadlines
- **Project Submission**: September 30, 2024, 23:59.

Late submissions will receive 0 points.

## Collaboration Policy

- **Permitted**: Discussing high-level concepts and debugging strategies with peers.
- **Not Permitted**: Sharing code, copying code from others, or using code from previous years.

Each student must contribute to the project and describe their contribution in `CONTRIBUTIONS.md`. The course staff may request individual explanations of your work.

## Additional Resources

- **RISC-V ISA Documentation**: [RISC-V Specifications](https://riscv.org/specifications/)
- **Chisel Documentation**: [Chisel](https://www.chisel-lang.org/)
- **Docker Documentation**: [Docker Docs](https://docs.docker.com/)

---

