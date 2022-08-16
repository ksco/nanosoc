`include "utils/defines.v"

module ex(
    input wire[31:0] inst_i,

    input wire[4:0] reg_waddr_i,

    input wire[31:0] op1_i,
    input wire[31:0] op2_i,

    output wire[31:0] reg_wdata_o,
    output wire[4:0] reg_waddr_o
);

reg[31:0] reg_wdata;

wire[6:0] opcode;
wire[2:0] funct3;
wire[6:0] funct7;
wire[4:0] rd;
wire[4:0] uimm;

wire[31:0] sri_shift;
wire[31:0] sri_shift_mask;

wire[31:0] op1_plus_op2_res;

wire op1_gte_op2_signed;
wire op1_gte_op2_unsigned;
wire op1_equ_op2;

assign opcode = inst_i[6:0];
assign funct3 = inst_i[14:12];
assign funct7 = inst_i[31:25];
assign rd = inst_i[11:7];
assign uimm = inst_i[19:15];

assign sri_shift = op1_i >> inst_i[24:20];
assign sri_shift_mask = 32'hffffffff >> inst_i[24:20];

assign op1_plus_op2_res     = op1_i + op2_i;

assign op1_gte_op2_signed   = $signed(op1_i) >= $signed(op2_i);
assign op1_gte_op2_unsigned = op1_i >= op2_i;
assign op1_equ_op2          = (op1_i == op2_i);

assign reg_waddr_o = reg_waddr_i;
assign reg_wdata_o = reg_wdata;

always @ (*) begin
    case (opcode)
        `OPCODE_I: begin
            case (funct3)
                `FUNCT3_ADDI: begin
                    reg_wdata = op1_plus_op2_res;
                end
                `FUNCT3_SLTI: begin
                    reg_wdata = {32{(~op1_gte_op2_signed)}} & 32'h1;
                end
                `FUNCT3_SLTIU: begin
                    reg_wdata = {32{(~op1_gte_op2_unsigned)}} & 32'h1;
                end
                `FUNCT3_XORI: begin
                    reg_wdata = op1_i ^ op2_i;
                end
                `FUNCT3_ORI: begin
                    reg_wdata = op1_i | op2_i;
                end
                `FUNCT3_ANDI: begin
                    reg_wdata = op1_i & op2_i;
                end
                `FUNCT3_SLLI: begin
                    reg_wdata = op1_i << inst_i[24:20];
                end
                `FUNCT3_SRI: begin
                    // SRAI
                    if (inst_i[30] == 1'b1) begin
                        reg_wdata = (sri_shift & sri_shift_mask) |
                            ({32{op1_i[31]}} & (~sri_shift_mask));
                    // SRLI
                    end else begin
                        reg_wdata = op1_i >> inst_i[24:20];
                    end
                end
                default: begin
                    reg_wdata = 32'b0;
                end
            endcase
        end
    endcase
end

endmodule