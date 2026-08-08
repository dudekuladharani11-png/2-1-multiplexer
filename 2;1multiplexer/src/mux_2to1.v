module mux_2to1 (
input I0,
input I1,
input S,
output Y
);

```
// 2:1 Multiplexer logic
assign Y = (~S & I0) | (S & I1);
```

endmodule
