// 32X32 Multiplier test template
module mult32x32_fast_test;

    logic clk;            // Clock
    logic reset;          // Reset
    logic start;          // Start signal
    logic [31:0] a;       // Input a
    logic [31:0] b;       // Input b
    logic busy;           // Multiplier busy indication
    logic [63:0] product; // Miltiplication product

// Put your code here
// ------------------
    mult32x32_fast uut (.clk(clk), .reset(reset),.start(start), .a(a), .b(b), .busy(busy), .product(product));

    initial begin  
        clk = 1'b0;
        start = 1'b0;
        reset = 1'b1;
        #35
        reset = 1'b0;
        #10
        a = 32'd212363295;
        b = 32'd322270968;
        #10
        start = 1'b1;
        #10
        start=1'b0;
        #100

        a = a&32'hFFFF;
        b = b&32'hFFFF;
        #10
        start = 1'b1;
        #10
        start=1'b0;
        #100

        $stop;
    end

    always begin
        #5
        clk = ~clk;
    end

// End of your code

endmodule
