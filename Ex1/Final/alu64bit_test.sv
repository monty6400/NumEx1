// 64-bit ALU test bench template
module alu64bit_test;

logic [63:0] a;
logic [63:0] b;
logic cin, cout;
logic [1:0] op;
logic [63:0] s;

alu64bit uut (.a(a), .b(b), .cin(cin), .op(op), .s(s), .cout(cout));

initial begin
    a = 64'b0;
    b = 64'b1;
    cin = 0;
    op = 2'b10;
    #1000
    op = 2'b11;
    #1000
    $stop;
end

endmodule
