// 4->1 multiplexer template
module mux4 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic d2,          // Data input 2
    input logic d3,          // Data input 3
    input logic [1:0] sel,   // Select input
    output logic z           // Output
);

logic w1,w2;
mux2 Sel1 (.d0(d0), .d1(d1), .sel(sel[0]), .z(w1));
mux2 Sel2 (.d0(d2), .d1(d3), .sel(sel[0]), .z(w2));
mux2 Sel3 (.d0(w1), .d1(w2), .sel(sel[1]), .z(z));

endmodule