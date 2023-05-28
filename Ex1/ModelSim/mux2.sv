// 2->1 multiplexer template
module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);

logic w1,w2,w3;
NAND2 #(.Tpdlh(6), .Tpdhl(6)) g1 (.Z(w1), .A(sel), .B(sel));
NAND2 #(.Tpdlh(6), .Tpdhl(6)) g2 (.Z(w2), .A(w1), .B(d0));
NAND2 #(.Tpdlh(6), .Tpdhl(6)) g3 (.Z(w3), .A(sel), .B(d1));
NAND2 #(.Tpdlh(6), .Tpdhl(6)) g4 (.Z(z), .A(w2), .B(w3));

endmodule
