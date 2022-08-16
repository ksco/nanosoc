module ram(
    input wire clk,
    input wire rst_,

    input wire we_i,
    input wire[31:0] addr_i,
    input wire[31:0] data_i,

    output reg[31:0] data_o
);

reg[31:0] data[0:4096-1];

always @ (posedge clk) begin
    if (we_i == 1'b1) begin
        data[addr_i[31:2]] <= data_i;
    end
end

always @ (*) begin
    if (rst_ == 1'b0) begin
        data_o = 32'b0;
    end else begin
        data_o = data[addr_i[31:2]];
    end
end

endmodule