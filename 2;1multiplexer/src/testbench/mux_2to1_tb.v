`timescale 1ns/1ps

module mux_2to1_tb;

```
reg I0;
reg I1;
reg S;

wire Y;

// Instantiate the multiplexer
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

    // S = 0 -> Select I0
    S = 0; I0 = 0; I1 = 0;
    #10;

    S = 0; I0 = 0; I1 = 1;
    #10;

    S = 0; I0 = 1; I1 = 0;
    #10;

    S = 0; I0 = 1; I1 = 1;
    #10;

    // S = 1 -> Select I1
    S = 1; I0 = 0; I1 = 0;
    #10;

    S = 1; I0 = 0; I1 = 1;
    #10;

    S = 1; I0 = 1; I1 = 0;
    #10;

    S = 1; I0 = 1; I1 = 1;
    #10;

    $finish;

end

// Display simulation values
initial begin
    $monitor("Time=%0t | S=%b | I0=%b | I1=%b | Y=%b",
             $time, S, I0, I1, Y);
end
```

endmodule
