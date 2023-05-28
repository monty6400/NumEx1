// Full Adder/Subtractor template
module fas (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic a_ns,        // A_nS (add/not subtract) control
    output logic s,          // Output S
    output logic cout        // Carry out
);


logic w1, w2, w3, w4, w5;
XNOR2 #(.Tpdlh(3), .Tpdhl(3)) g1 (.Z(w1), .A(a_ns), .B(a));
OR2 #(.Tpdlh(3), .Tpdhl(3)) g2 (.Z(w2), .A(b), .B(cin));
NAND2 #(.Tpdlh(6), .Tpdhl(6)) g3 (.Z(w3), .A(b), .B(cin));
XNOR2 #(.Tpdlh(3), .Tpdhl(3)) g4 (.Z(w4), .A(b), .B(cin));
NAND2 #(.Tpdlh(6), .Tpdhl(6)) g5 (.Z(w5), .A(w1), .B(w2));
XNOR2 #(.Tpdlh(3), .Tpdhl(3)) g6 (.Z(s), .A(a), .B(w4));
NAND2 #(.Tpdlh(6), .Tpdhl(6)) g7 (.Z(cout), .A(w5), .B(w3));


endmodule
