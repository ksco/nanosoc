`timescale 1ns/1ns

module id_test_bench;
    reg[31:0] id_1_inst_i;
    reg[31:0] id_1_inst_addr_i;
    reg[31:0] id_1_reg1_rdata_i;
    reg[31:0] id_1_reg2_rdata_i;

    wire[31:0] id_1_op1_o;
    wire[31:0] id_1_op2_o;
    wire[31:0] id_1_inst_o;
    wire[31:0] id_1_inst_addr_o;
    wire[4:0] id_1_reg1_raddr_o;
    wire[4:0] id_1_reg2_raddr_o;
    wire[4:0] id_1_reg_waddr_o;

    id id_1 (
        .inst_i(id_1_inst_i),
        .inst_addr_i(id_1_inst_addr_i),
        .reg1_rdata_i(id_1_reg1_rdata_i),
        .reg2_rdata_i(id_1_reg2_rdata_i),

        .op1_o(id_1_op1_o),
        .op2_o(id_1_op2_o),
        .inst_o(id_1_inst_o),
        .inst_addr_o(id_1_inst_addr_o),
        .reg1_raddr_o(id_1_reg1_raddr_o),
        .reg2_raddr_o(id_1_reg2_raddr_o),
        .reg_waddr_o(id_1_reg_waddr_o)
    );

    initial begin
        #1 begin
            id_1_inst_i = 32'hfff08013; // addi  x0 , x1 , -1
            id_1_inst_addr_i = 32'h123;
            id_1_reg1_rdata_i = 32'h42;
            id_1_reg2_rdata_i = 32'h69;
        end
        #1 begin
            if (id_1_op1_o == 32'h42 && id_1_op2_o == 32'hffffffff &&
                id_1_reg1_raddr_o == 5'h1 && id_1_reg2_raddr_o == 5'h0 &&
                id_1_reg_waddr_o == 5'h0) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            id_1_inst_i = 32'h0021a113; // slti  x2 , x3 , 2
            id_1_inst_addr_i = 32'h123;
            id_1_reg1_rdata_i = 32'h42;
            id_1_reg2_rdata_i = 32'h69;
        end
        #1 begin
            if (id_1_op1_o == 32'h42 && id_1_op2_o == 32'h2 &&
                id_1_reg1_raddr_o == 5'h3 && id_1_reg2_raddr_o == 5'h0 &&
                id_1_reg_waddr_o == 5'h2) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            id_1_inst_i = 32'hffd2b213; // sltiu x4 , x5 , -3
            id_1_inst_addr_i = 32'h123;
            id_1_reg1_rdata_i = 32'h42;
            id_1_reg2_rdata_i = 32'h69;
        end
        #1 begin
            if (id_1_op1_o == 32'h42 && id_1_op2_o == 32'hfffffffd &&
                id_1_reg1_raddr_o == 5'h5 && id_1_reg2_raddr_o == 5'h0 &&
                id_1_reg_waddr_o == 5'h4) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            id_1_inst_i = 32'h0043c313; // xori  x6 , x7 , 4
            id_1_inst_addr_i = 32'h123;
            id_1_reg1_rdata_i = 32'h42;
            id_1_reg2_rdata_i = 32'h69;
        end
        #1 begin
            if (id_1_op1_o == 32'h42 && id_1_op2_o == 32'h4 &&
                id_1_reg1_raddr_o == 5'h7 && id_1_reg2_raddr_o == 5'h0 &&
                id_1_reg_waddr_o == 5'h6) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            id_1_inst_i = 32'hffb4e413; // ori   x8 , x9 , -5
            id_1_inst_addr_i = 32'h123;
            id_1_reg1_rdata_i = 32'h42;
            id_1_reg2_rdata_i = 32'h69;
        end
        #1 begin
            if (id_1_op1_o == 32'h42 && id_1_op2_o == 32'hfffffffb /* -5 */ &&
                id_1_reg1_raddr_o == 5'h9 && id_1_reg2_raddr_o == 5'h0 &&
                id_1_reg_waddr_o == 5'h8) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            id_1_inst_i = 32'h0065f513; // andi  x10, x11, 6
            id_1_inst_addr_i = 32'h123;
            id_1_reg1_rdata_i = 32'h42;
            id_1_reg2_rdata_i = 32'h69;
        end
        #1 begin
            if (id_1_op1_o == 32'h42 && id_1_op2_o == 32'h6 &&
                id_1_reg1_raddr_o == 5'hb && id_1_reg2_raddr_o == 5'h0 &&
                id_1_reg_waddr_o == 5'ha) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            id_1_inst_i = 32'h00769613; // slli  x12, x13, 7
            id_1_inst_addr_i = 32'h123;
            id_1_reg1_rdata_i = 32'h42;
            id_1_reg2_rdata_i = 32'h69;
        end
        #1 begin
            if (id_1_op1_o == 32'h42 && id_1_op2_o == 32'h7 &&
                id_1_reg1_raddr_o == 5'hd && id_1_reg2_raddr_o == 5'h0 &&
                id_1_reg_waddr_o == 5'hc) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            id_1_inst_i = 32'h0087d713; // srli  x14, x15, 8
            id_1_inst_addr_i = 32'h123;
            id_1_reg1_rdata_i = 32'h42;
            id_1_reg2_rdata_i = 32'h69;
        end
        #1 begin
            if (id_1_op1_o == 32'h42 && id_1_op2_o == 32'h8 &&
                id_1_reg1_raddr_o == 5'hf && id_1_reg2_raddr_o == 5'h0 &&
                id_1_reg_waddr_o == 5'he) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            id_1_inst_i = 32'h4098d813; // srai  x16, x17, 9
            id_1_inst_addr_i = 32'h123;
            id_1_reg1_rdata_i = 32'h42;
            id_1_reg2_rdata_i = 32'h69;
        end
        #1 begin
            if (id_1_op1_o == 32'h42 && id_1_op2_o == 32'h409 &&
                id_1_reg1_raddr_o == 5'h11 && id_1_reg2_raddr_o == 5'h0 &&
                id_1_reg_waddr_o == 5'h10) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            $finish;
        end
    end

    initial begin
        $dumpfile("id.vcd");
        $dumpvars(0, id_1);
    end

endmodule