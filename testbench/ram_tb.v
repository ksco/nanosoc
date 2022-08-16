`timescale 1ns/1ns

module ram_test_bench;
    reg ram_1_clk;
    reg ram_1_rst_;
    reg ram_1_we_i;

    reg[31:0]  ram_1_addr_i;
    reg[31:0] ram_1_data_i;

    wire[31:0] ram_1_data_o;

    ram ram_1 (
        .clk  (ram_1_clk),
        .rst_ (ram_1_rst_),
        .we_i(ram_1_we_i),
        .addr_i(ram_1_addr_i),
        .data_i(ram_1_data_i),
        .data_o(ram_1_data_o)
    );

    initial begin
        #0 begin
            ram_1_clk <= 1'b1;
            ram_1_rst_ <= 0;
        end

        // TIME 1
        #1 begin
            ram_1_rst_ <= 1;
        end

        // TIME 2
        #1 begin
            ram_1_addr_i <= 5'h8;
            ram_1_data_i <= 32'h42;
            ram_1_we_i <= 1'b1;
        end

        // TIME 3
        #1 begin
            if (ram_1_data_o == 32'h42) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
            ram_1_we_i <= 1'b0;
        end

        // TIME 4
        #1 begin
            ram_1_rst_ <= 0;
        end

        // TIME 5
        #1 begin
            if (ram_1_data_o == 32'h0) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
            ram_1_we_i <= 1'b0;
        end

        #1 begin
            $finish;
        end
    end

    always #1 begin
        ram_1_clk <= ~ram_1_clk;
    end

    initial begin
        $dumpfile("regs.vcd");
        $dumpvars(0, ram_1);
    end

endmodule