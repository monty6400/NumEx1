// 32X32 Multiplier FSM
module mult32x32_fast_fsm (
    input logic clk,              // Clock
    input logic reset,            // Reset
    input logic start,            // Start signal
    input logic a_msb_is_0,       // Indicates MSB of operand A is 0
    input logic b_msw_is_0,       // Indicates MSW of operand B is 0
    output logic busy,            // Multiplier busy indication
    output logic [1:0] a_sel,     // Select one byte from A
    output logic b_sel,           // Select one 2-byte word from B
    output logic [2:0] shift_sel, // Select output from shifters
    output logic upd_prod,        // Update the product register
    output logic clr_prod         // Clear the product register
);

// Put your code here
typedef enum { Idle, S0, S1, S2, S3, S4, S5, S6, S7} sm_type;
logic start_flag;
sm_type current_state;
sm_type next_state;
// Put your code here
// ------------------
always_comb begin 
    busy = 1'b1;
    next_state = Idle;
    a_sel = 2'b0;
    b_sel = 1'b0;
    upd_prod = 1'b1;
    shift_sel = 3'b0;
    clr_prod = 1'b0;
    case (current_state)
        Idle: begin
            upd_prod = 1'b0;
            busy = 0'b0;
            if (start_flag == 1'b1) begin
                next_state = S0;
                clr_prod = 1'b1;               
            end
        end
        S0: begin
            next_state = S1;
        end
        S1: begin 
            if (b_msw_is_0 == 1'b0) begin
                next_state = S2;
                b_sel = 1'b1;
                shift_sel = 3'b10;
            end
            else begin
                next_state = S3;
                a_sel = 2'b01;
                shift_sel = 2'b001;
            end
        end
        S2: begin
            next_state = S3;
            a_sel = 2'b1;
            shift_sel = 3'b1;
        end
        S3: begin
            if (b_msw_is_0 == 1'b0) begin
                next_state = S4;
                a_sel = 2'b1;
                b_sel = 1'b1;
                shift_sel = 3'b11;
            end
            else begin
                next_state = S5;
                a_sel = 2'b10;
                b_sel = 1'b0;
                shift_sel = 3'b010;
                if (a_msb_is_0 == 1'b1) begin
                    next_state = Idle;
                end
            end
        end
        S4: begin
            next_state = S5;
            a_sel = 2'b10;
            shift_sel = 3'b10;
        end
        S5: begin
            next_state = Idle;
            if (b_msw_is_0 == 1'b1) begin 
                a_sel = 2'b11;
                b_sel = 1'b0;
                shift_sel = 3'b011;
            end
            else begin
                a_sel = 2'b10;
                b_sel = 1'b1;
                shift_sel = 3'b100;
                if (a_msb_is_0==0) begin
                    next_state = s6;
                end
            end
            next_state = S6;
            a_sel = 2'b10;
            b_sel = 1'b1;
            shift_sel = 3'b100;
        end
        S6: begin
            next_state = S7;
            a_sel = 2'b11;
            shift_sel = 3'b11;
        end
        S7: begin
            next_state = Idle;
            a_sel = 2'b11;
            b_sel = 1'b1;
            shift_sel = 3'b101;
        end
    endcase
end

always_ff @(posedge clk, posedge reset) begin
    start_flag <= 1'b0;
    if (reset == 1'b1) begin
        current_state <= Idle;
    end
    else begin 
        current_state <= next_state;
        if (start==1'b1) begin
            start_flag <= 1'b1;
        end
    end
end

// End of your code

endmodule
