`timescale 1ns/1ns

module ex_test_bench;
    reg[31:0] ex_1_inst_i;
    reg[4:0] ex_1_reg_waddr_i;

    reg[31:0] ex_1_op1_i;
    reg[31:0] ex_1_op2_i;

    wire[31:0] ex_1_reg_wdata_o;
    wire[4:0] ex_1_reg_waddr_o;

    ex ex_1 (
        .inst_i(ex_1_inst_i),
        .reg_waddr_i(ex_1_reg_waddr_i),
        .op1_i(ex_1_op1_i),
        .op2_i(ex_1_op2_i),

        .reg_wdata_o(ex_1_reg_wdata_o),
        .reg_waddr_o(ex_1_reg_waddr_o)
    );

    initial begin
        #1 begin
            ex_1_inst_i = 32'hfff08013; // addi  x0 , x1 , -1
            ex_1_reg_waddr_i = 5'h3;
            ex_1_op1_i = 32'h42;
            ex_1_op2_i = 32'h69;
        end
        #1 begin
            if (ex_1_reg_wdata_o == 32'hab && ex_1_reg_waddr_o == 5'h3) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            ex_1_inst_i = 32'h0021a113; // slti  x2 , x3 , 2
            ex_1_reg_waddr_i = 5'h3;
            ex_1_op1_i = 32'h42;
            ex_1_op2_i = 32'h69;
        end
        #1 begin
            if (ex_1_reg_wdata_o == 32'h1 && ex_1_reg_waddr_o == 5'h3) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            ex_1_inst_i = 32'hffd2b213; // sltiu x4 , x5 , -3
            ex_1_reg_waddr_i = 5'h3;
            ex_1_op1_i = 32'h42;
            ex_1_op2_i = 32'h69;
        end
        #1 begin
            if (ex_1_reg_wdata_o == 32'h1 && ex_1_reg_waddr_o == 5'h3) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            ex_1_inst_i = 32'h0043c313; // xori  x6 , x7 , 4
            ex_1_reg_waddr_i = 5'h3;
            ex_1_op1_i = 32'h42;
            ex_1_op2_i = 32'h69;
        end
        #1 begin
            if (ex_1_reg_wdata_o == 32'h2b && ex_1_reg_waddr_o == 5'h3) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            ex_1_inst_i = 32'hffb4e413; // ori   x8 , x9 , -5
            ex_1_reg_waddr_i = 5'h3;
            ex_1_op1_i = 32'h42;
            ex_1_op2_i = 32'h69;
        end
        #1 begin
            if (ex_1_reg_wdata_o == 32'h6b && ex_1_reg_waddr_o == 5'h3) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            ex_1_inst_i = 32'h0065f513; // andi  x10, x11, 6
            ex_1_reg_waddr_i = 5'h3;
            ex_1_op1_i = 32'h42;
            ex_1_op2_i = 32'h69;
        end
        #1 begin
            if (ex_1_reg_wdata_o == 32'h40 && ex_1_reg_waddr_o == 5'h3) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            ex_1_inst_i = 32'h00769613; // slli  x12, x13, 7
            ex_1_reg_waddr_i = 5'h3;
            ex_1_op1_i = 32'h42;
            ex_1_op2_i = 32'h69;
        end
        #1 begin
            if (ex_1_reg_wdata_o == 32'h2100 && ex_1_reg_waddr_o == 5'h3) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            ex_1_inst_i = 32'h0017d713; // srli  x14, x15, 1
            ex_1_reg_waddr_i = 5'h3;
            ex_1_op1_i = 32'h42;
            ex_1_op2_i = 32'h69;
        end
        #1 begin
            if (ex_1_reg_wdata_o == 32'h21 && ex_1_reg_waddr_o == 5'h3) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            ex_1_inst_i = 32'h4018d813; // srai  x16, x17, 1
            ex_1_reg_waddr_i = 5'h3;
            ex_1_op1_i = 32'h42;
            ex_1_op2_i = 32'h69;
        end
        #1 begin
            if (ex_1_reg_wdata_o == 32'h21 && ex_1_reg_waddr_o == 5'h3) begin
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
        $dumpfile("ex.vcd");
        $dumpvars(0, ex_1);
    end

endmodule