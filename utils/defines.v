`define OPCODE_I     7'b0010011
`define OPCODE_L     7'b0000011
`define OPCODE_S     7'b0100011
`define OPCODE_R_M   7'b0110011
`define OPCODE_B     7'b1100011
`define OPCODE_JAL   7'b1101111
`define OPCODE_JALR  7'b1100111
`define OPCODE_LUI   7'b0110111
`define OPCODE_AUIPC 7'b0010111
`define OPCODE_FENCE 7'b0001111
`define OPCODE_CSR   7'b1110011

`define FUNCT3_ADDI  3'b000
`define FUNCT3_SLTI  3'b010
`define FUNCT3_SLTIU 3'b011
`define FUNCT3_XORI  3'b100
`define FUNCT3_ORI   3'b110
`define FUNCT3_ANDI  3'b111
`define FUNCT3_SLLI  3'b001
`define FUNCT3_SRLI  3'b101