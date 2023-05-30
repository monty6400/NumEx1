// 4->1 multiplexer test bench template
module mux4_test;

logic d0, d1, d2, d3, z;
logic [1:0] sel;

mux4 uut (.d0(d0), .d1(d1), .d2(d2), .d3(d3), .z(z), .sel(sel));

initial begin
    {d0,d1,d2,d3} = 4'd2;
    sel = 2'b00;

    #30

    sel = 2'b10;

    #15
    
    sel = 2'b00;

    #15

    $stop;
end

endmodule
