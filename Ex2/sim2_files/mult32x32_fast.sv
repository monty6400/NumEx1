// 32X32 Iterative Multiplier template
module mult32x32_fast (
    input logic clk,            // Clock
    input logic reset,          // Reset
    input logic start,          // Start signal
    input logic [31:0] a,       // Input a
    input logic [31:0] b,       // Input b
    output logic busy,          // Multiplier busy indication
    output logic [63:0] product // Miltiplication product
);

// Put your code here
// ------------------
logic [1:0] a_sel;
logic [2:0] shift_sel;
logic b_sel, upd_prod, clr_prod, a_msb_is_0, b_msw_is_0;
mult32x32_fast_fsm mul_fsm (.clk(clk), .reset(reset), .start(start), .a_msb_is_0(a_msb_is_0), .b_msw_is_0(b_msw_is_0), .busy(busy), .a_sel(a_sel),
                       .b_sel(b_sel), .shift_sel(shift_sel), .upd_prod(upd_prod), .clr_prod(clr_prod));
mult32x32_fast_arith mul_arth (.clk(clk), .reset(reset), .a(a), .b(b), .a_msb_is_0(a_msb_is_0), .b_msw_is_0(b_msw_is_0), .a_sel(a_sel), .b_sel(b_sel),
                          .shift_sel(shift_sel), .upd_prod(upd_prod), .clr_prod(clr_prod), .product(product));

// End of your code

endmodule
