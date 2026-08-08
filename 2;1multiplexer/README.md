# 2:1 Multiplexer Using Verilog HDL

## 📌 Project Description

A **2:1 Multiplexer (MUX)** is a combinational logic circuit that selects one of two input signals and sends the selected input to a single output.

The 2:1 Multiplexer has:

* Two data inputs: `I0` and `I1`
* One select input: `S`
* One output: `Y`

The select input determines which data input is connected to the output.

## 🔌 Inputs and Output

### Inputs

* `I0` – First data input
* `I1` – Second data input
* `S` – Select signal

### Output

* `Y` – Selected output

## ⚙️ Working Principle

The operation depends on the select signal:

```text
S = 0 → Y = I0
S = 1 → Y = I1
```

### Logic Equation

```text
Y = (~S & I0) | (S & I1)
```

## 📊 Truth Table

| S | I0 | I1 | Y |
| - | -- | -- | - |
| 0 | 0  | 0  | 0 |
| 0 | 0  | 1  | 0 |
| 0 | 1  | 0  | 1 |
| 0 | 1  | 1  | 1 |
| 1 | 0  | 0  | 0 |
| 1 | 0  | 1  | 1 |
| 1 | 1  | 0  | 0 |
| 1 | 1  | 1  | 1 |

## 💻 Verilog Design

File: `src/mux_2to1.v`

```verilog
module mux_2to1 (
    input I0,
    input I1,
    input S,
    output Y
);

    assign Y = (~S & I0) | (S & I1);

endmodule
```

## 🧪 Testbench

File: `testbench/mux_2to1_tb.v`

The testbench tests all possible combinations of `I0`, `I1`, and the select signal `S`.

A VCD waveform file is also generated for simulation analysis.

```verilog
`timescale 1ns/1ps

module mux_2to1_tb;

    reg I0;
    reg I1;
    reg S;

    wire Y;

    // Instantiate 2:1 Multiplexer
    mux_2to1 uut (
        .I0(I0),
        .I1(I1),
        .S(S),
        .Y(Y)
    );

    initial begin

        // Generate waveform
        $dumpfile("simulation/waveform.vcd");
        $dumpvars(0, mux_2to1_tb);

        $display("S | I0 I1 | Y");
        $display("------------");

        // Test case 1
        S = 0; I0 = 0; I1 = 0;
        #10;
        $display("%b |  %b  %b | %b", S, I0, I1, Y);

        // Test case 2
        S = 0; I0 = 0; I1 = 1;
        #10;
        $display("%b |  %b  %b | %b", S, I0, I1, Y);

        // Test case 3
        S = 0; I0 = 1; I1 = 0;
        #10;
        $display("%b |  %b  %b | %b", S, I0, I1, Y);

        // Test case 4
        S = 0; I0 = 1; I1 = 1;
        #10;
        $display("%b |  %b  %b | %b", S, I0, I1, Y);

        // Test case 5
        S = 1; I0 = 0; I1 = 0;
        #10;
        $display("%b |  %b  %b | %b", S, I0, I1, Y);

        // Test case 6
        S = 1; I0 = 0; I1 = 1;
        #10;
        $display("%b |  %b  %b | %b", S, I0, I1, Y);

        // Test case 7
        S = 1; I0 = 1; I1 = 0;
        #10;
        $display("%b |  %b  %b | %b", S, I0, I1, Y);

        // Test case 8
        S = 1; I0 = 1; I1 = 1;
        #10;
        $display("%b |  %b  %b | %b", S, I0, I1, Y);

        $finish;

    end

    // Display values whenever they change
    initial begin
        $monitor("Time=%0t | S=%b | I0=%b | I1=%b | Y=%b",
                 $time, S, I0, I1, Y);
    end

endmodule
```

## ▶️ Simulation

This project can be simulated using **Icarus Verilog** and **GTKWave**.

### Step 1: Compile

From the project directory:

```bash
iverilog -o mux_sim src/mux_2to1.v testbench/mux_2to1_tb.v
```

### Step 2: Run

```bash
vvp mux_sim
```

The simulation generates:

```text
simulation/waveform.vcd
```

### Step 3: View Waveform

Open the waveform using GTKWave:

```bash
gtkwave simulation/waveform.vcd
```

Add these signals:

```text
I0
I1
S
Y
```

## 📈 Expected Simulation

When `S = 0`:

```text
Y = I0
```

When `S = 1`:

```text
Y = I1
```

For example:

```text
S = 0, I0 = 1, I1 = 0 → Y = 1

S = 0, I0 = 0, I1 = 1 → Y = 0

S = 1, I0 = 0, I1 = 1 → Y = 1

S = 1, I0 = 1, I1 = 0 → Y = 0
```

## 📋 Expected Output

```text
S | I0 I1 | Y
------------
0 |  0  0 | 0
0 |  0  1 | 0
0 |  1  0 | 1
0 |  1  1 | 1
1 |  0  0 | 0
1 |  0  1 | 1
1 |  1  0 | 0
1 |  1  1 | 1
```

## 🛠️ Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* Git
* GitHub

## 🎯 Applications

2:1 Multiplexers are commonly used in:

* Data selection
* Data routing
* Processor datapaths
* Digital switching
* Control circuits
* Arithmetic circuits
* Communication systems

## ✅ Conclusion

The **2:1 Multiplexer** was successfully designed and verified using Verilog HDL. The testbench checks all possible combinations of the inputs and select signal. The simulation confirms that the output `Y` correctly selects `I0` when `S = 0` and `I1` when `S = 1`.

## 👨‍💻 Author

**Your Name**

GitHub: **Your GitHub Username**
