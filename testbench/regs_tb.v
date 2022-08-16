`timescale 1ns/1ns

module regs_test_bench;
    reg regs_1_clk;
    reg regs_1_rst_;
    reg regs_1_we_i;

    reg[4:0]  regs_1_waddr_i;
    reg[31:0] regs_1_wdata_i;
    reg[4:0] regs_1_raddr1_i;
    reg[4:0] regs_1_raddr2_i;

    wire[31:0] regs_1_rdata1_o;
    wire[31:0] regs_1_rdata2_o;

    regs regs_1 (
        .clk  (regs_1_clk),
        .rst_ (regs_1_rst_),
        .we_i(regs_1_we_i),
        .waddr_i(regs_1_waddr_i),
        .wdata_i(regs_1_wdata_i),
        .raddr1_i(regs_1_raddr1_i),
        .raddr2_i(regs_1_raddr2_i),
        .rdata1_o(regs_1_rdata1_o),
        .rdata2_o(regs_1_rdata2_o)
    );

    initial begin
        #0 begin
            regs_1_clk <= 1'b1;
            regs_1_rst_ <= 0;
        end

        // TIME 1
        #1 begin
            regs_1_rst_ <= 1;
        end

        // TIME 2
        #1 begin
            regs_1_waddr_i <= 5'h1;
            regs_1_wdata_i <= 32'h42;
            regs_1_we_i <= 1'b1;
            regs_1_raddr1_i <= 5'h1;
        end

        // TIME 3
        #1 begin
            if (regs_1_rdata1_o == 32'h42) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
            regs_1_we_i <= 1'b0;
        end

        // TIME 4
        #1 begin
            regs_1_raddr1_i <= 5'h1;
            regs_1_raddr2_i <= 5'h0;
        end

        // TIME 5
        #1 begin
            if (regs_1_rdata1_o == 32'h42 && regs_1_rdata2_o == 32'h0) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        // TIME 6
        #1 begin
            regs_1_waddr_i <= 5'h1f;
            regs_1_wdata_i <= 32'hDEADBEEF;
            regs_1_we_i <= 1'b1;
        end

        // TIME 7
        #1 begin
            regs_1_raddr1_i <= 5'h1f;
            regs_1_we_i <= 1'b0;
        end

        // TIME 10
        #3 begin
            regs_1_raddr1_i <= 5'h1f;
            if (regs_1_rdata1_o == 32'hDEADBEEF) begin
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
        regs_1_clk <= ~regs_1_clk;
    end

    initial begin
        $dumpfile("regs.vcd");
        $dumpvars(0, regs_1);
    end

endmodule