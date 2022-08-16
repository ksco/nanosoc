module gen_pipe_dff #(
    parameter DW = 32
) (
    input wire clk,
    input wire rst_,

    input wire[DW-1:0] default_val,
    input wire[DW-1:0] d_i,
    output wire[DW-1:0] q_o
);

reg[DW-1:0] q_r;

always @ (posedge clk) begin
    if (!rst_) begin
        q_r <= default_val;
    end else begin
        q_r <= d_i;
    end
end

assign q_o = q_r;

endmodule