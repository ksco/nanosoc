module if_id(
    input wire clk,
    input wire rst_,

    input wire[31:0] inst_i,
    input wire[31:0] inst_addr_i,

    output wire[31:0] inst_o,
    output wire[31:0] inst_addr_o
);

gen_pipe_dff #(32) inst_dff(
    clk,
    rst_,
    32'h00000013 /* addi x0, x0, 0 (a.k.a nop) */,
    inst_i,
    inst_o
);

gen_pipe_dff #(32) inst_addr_dff(
    clk,
    rst_,
    32'h0,
    inst_addr_i,
    inst_addr_o
);

endmodule