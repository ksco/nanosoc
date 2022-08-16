`include "utils/defines.v"

module id(
    input wire[31:0] inst_i,
    input wire[31:0] inst_addr_i,

    input wire[31:0] reg1_rdata_i,
    input wire[31:0] reg2_rdata_i,

    output reg[31:0] op1_o,
    output reg[31:0] op2_o,
    output reg[31:0] inst_o,
    output reg[31:0] inst_addr_o,
    output reg[4:0] reg1_raddr_o,
    output reg[4:0] reg2_raddr_o,
    output reg[4:0] reg_waddr_o
);

wire[6:0] opcode = inst_i[6:0];
wire[2:0] funct3 = inst_i[14:12];
wire[6:0] funct7 = inst_i[31:25];
wire[4:0] rd = inst_i[11:7];
wire[4:0] rs1 = inst_i[19:15];
wire[4:0] rs2 = inst_i[24:20];

always @ (*) begin
    inst_o = inst_i;
    inst_addr_o = inst_addr_i;
    op1_o = 32'h0;
    op2_o = 32'h0;

    case (opcode)
        `OPCODE_I: begin
            case (funct3)
                `FUNCT3_ADDI, `FUNCT3_SLTI, `FUNCT3_SLTIU,
                `FUNCT3_XORI, `FUNCT3_ORI, `FUNCT3_ANDI,
                `FUNCT3_SLLI, `FUNCT3_SRLI: begin
                    reg_waddr_o = rd;
                    reg1_raddr_o = rs1;
                    reg2_raddr_o = 5'h0;
                    op1_o = reg1_rdata_i;
                    op2_o = {{20{inst_i[31]}}, inst_i[31:20]};
                end
                default: begin
                    reg_waddr_o = 5'h0;
                    reg1_raddr_o = 5'h0;
                    reg2_raddr_o = 5'h0;
                end
            endcase
        end
        default: begin
            reg_waddr_o = 5'h0;
            reg1_raddr_o = 5'h0;
            reg2_raddr_o = 5'h0;
        end
    endcase
end

endmodule