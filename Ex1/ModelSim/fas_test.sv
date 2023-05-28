// Full Adder/Subtractor test bench template
module fas_test;

logic a, b, cin, a_ns, s, cout;

fas uut (.a(a), .b(b), .cin(cin), .a_ns(a_ns), .s(s), .cout(cout));

initial begin
    {a,b,cin,a_ns} = 4'd4;

    #20
    a = 1'b1;

    #20
    a = 1'b0;

    #20
    $stop;
end
endmodule
