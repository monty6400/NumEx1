// 32X32 Multiplier arithmetic unit template
module mult32x32_arith (
    input logic clk,             // Clock
    input logic reset,           // Reset
    input logic [31:0] a,        // Input a
    input logic [31:0] b,        // Input b
    input logic [1:0] a_sel,     // Select one byte from A
    input logic b_sel,           // Select one 2-byte word from B
    input logic [2:0] shift_sel, // Select output from shifters
    input logic upd_prod,        // Update the product register
    input logic clr_prod,        // Clear the product register
    output logic [63:0] product  // Miltiplication product
);
logic [23:0] mul;
logic [63:0] shifted_mul;
logic [5:0] shift_tmp;
logic [63:0] sum;
logic [7:0] a_byte;
logic [15:0] b_word;

always_comb begin
    a_byte = a[7:0];
    case (a_sel)
        2'b01: begin
            a_byte = a[15:8];
        end
        2'b10: begin
            a_byte = a[23:16];
        end
        2'b11: begin
            a_byte = a[31:24];
        end
    endcase
    b_word = b[15:0];
    if (b_sel == 1'b1) begin
        b_word = b[31:16];
    end
    mul = a_byte*b_word;
    if (shift_sel == 3'b110 || shift_sel == 3'b111) begin
        shifted_mul = 64'b0;
    end
    else begin 
        shift_tmp = shift_sel << 3;
        shifted_mul = mul<<(shift_tmp);
    end
    product = sum;
end

always_ff begin @(posedge clk, posedge reset)
    if (reset == 1'b1 || clr_prod == 1'b1) begin 
        sum <= 64'b0;
    end
    else if (upd_prod == 1'b1) begin
        sum <= sum + shifted_mul;
    end
end

// End of your code

endmodule
