module pcreg(
    input wire clk,
    input wire rst_,

    input wire jump_flag_i,
    input wire[31:0] jump_addr_i,

    output reg[31:0] pc_o
);

always @ (posedge clk) begin
    if (rst_ == 1'b0) begin
        pc_o <= 32'h0;
    end else if (jump_flag_i == 1'b1) begin
        pc_o <= jump_addr_i;
    end else begin
        pc_o <= pc_o + 4'h4;
    end
end

endmodule