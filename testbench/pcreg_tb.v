`timescale 1ns/1ns

module pcreg_test_bench;
    reg pcreg_1_clk;
    reg pcreg_1_rst_;
    reg pcreg_1_jump_flag_i;
    reg[31:0] pcreg_1_jump_addr_i;

    wire[31:0] pcreg_1_pc_o;

    pcreg pcreg_1 (
        .clk  (pcreg_1_clk),
        .rst_ (pcreg_1_rst_),
        .jump_flag_i(pcreg_1_jump_flag_i),
        .jump_addr_i(pcreg_1_jump_addr_i),

        .pc_o (pcreg_1_pc_o)
    );

    initial begin
        #0 begin
            pcreg_1_clk <= 1'b1;
            pcreg_1_rst_ <= 0;
        end

        // TIME 1
        #1 begin
            if (pcreg_1_pc_o == 32'h0) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end
        #1 pcreg_1_rst_ <= 1;

        // TIME 3
        #1 begin
            if (pcreg_1_pc_o == 32'h4) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 pcreg_1_rst_ <= 0;

        // TIME 5
        #1 begin
            if (pcreg_1_pc_o == 32'h0) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end
        #1 pcreg_1_rst_ <= 1;

        // TIME 11
        #5 begin
            if (pcreg_1_pc_o == 32'hC) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            pcreg_1_jump_flag_i <= 1;
            pcreg_1_jump_addr_i <= 32'hDEADBEEF;
        end

        // TIME 13
        #1 begin
            if (pcreg_1_pc_o == 32'hDEADBEEF) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 pcreg_1_jump_flag_i <= 0;

        // TIME 17
        #3 begin
            if (pcreg_1_pc_o == 32'hDEADBEF7) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        #1 begin
            $finish;
        end
    end

    always #1 begin
        pcreg_1_clk <= ~pcreg_1_clk;
    end

    initial begin
        $dumpfile("pcreg.vcd");
        $dumpvars(0, pcreg_1);
    end

endmodule