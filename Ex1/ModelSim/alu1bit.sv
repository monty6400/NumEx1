// 1-bit ALU template
module alu1bit (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic s,          // Output S
    output logic cout        // Carry out
);

logic w1,w2,w3,w4,w5,w6,w7;

NAND2 #(.Tpdlh(6), .Tpdhl(6)) g1 (.Z(w1), .A(op[0]), .B(op[0]));
OR2 #(.Tpdlh(3), .Tpdhl(3)) g2 (.Z(w2), .A(a), .B(b));
XNOR2 #(.Tpdlh(3), .Tpdhl(3)) g3 (.Z(w3), .A(a), .B(b));
NAND2 #(.Tpdlh(6), .Tpdhl(6)) g4 (.Z(w4), .A(w1), .B(w2));
NAND2 #(.Tpdlh(6), .Tpdhl(6)) g5 (.Z(w5), .A(op[0]), .B(w3));
XNOR2 #(.Tpdlh(3), .Tpdhl(3)) g6 (.Z(w6), .A(w4), .B(w5));
fas FAS (.a(a), .b(b), .cin(cin), .a_ns(w1), .s(w7), .cout(cout));
mux2 Sel (.d0(w6), .d1(w7), .sel(op[1]), .z(s));

endmodule
