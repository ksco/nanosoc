`timescale 1ns/1ns

module if_id_test_bench;
    reg if_id_1_clk;
    reg if_id_1_rst_;
    reg[31:0] if_id_1_inst_i;
    reg[31:0] if_id_1_inst_addr_i;

    wire[31:0] if_id_1_inst_o;
    wire[31:0] if_id_1_inst_addr_o;

    if_id if_id_1 (
        .clk  (if_id_1_clk),
        .rst_ (if_id_1_rst_),

        .inst_i(if_id_1_inst_i),
        .inst_addr_i(if_id_1_inst_addr_i),

        .inst_o(if_id_1_inst_o),
        .inst_addr_o(if_id_1_inst_addr_o)
    );

    initial begin
        #0 begin
            if_id_1_clk <= 1'b1;
            if_id_1_rst_ <= 0;
        end

        // TIME 1
        #1 begin
            if (if_id_1_inst_addr_o == 32'h0 && if_id_1_inst_o == 32'h00000013) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        // TIME 2
        #1 begin
            if_id_1_rst_ <= 1;
            if_id_1_inst_addr_i <= 32'hDEADBEEF;
            if_id_1_inst_i <= 32'hBABECAFE;
        end

        // TIME 3
        #1 begin
            if (if_id_1_inst_addr_o == 32'hDEADBEEF && if_id_1_inst_o == 32'hBABECAFE) begin
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
        if_id_1_clk <= ~if_id_1_clk;
    end

    initial begin
        $dumpfile("if_id.vcd");
        $dumpvars(0, if_id_1);
    end

endmodule