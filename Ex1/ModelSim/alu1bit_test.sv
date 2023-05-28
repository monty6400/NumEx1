// Full Adder/Subtractor test bench template
module alu1bit_test;

logic a, b, cin, s, cout;
logic [1:0] op;

alu1bit uut (.a(a), .b(b), .cin(cin), .cout(cout), .s(s), .op(op));

initial begin
    {a,b,cin} = 3'd1;
    op = 2'b10;
    #30
    a = 1;
    #20
    $stop;
end
endmodule
