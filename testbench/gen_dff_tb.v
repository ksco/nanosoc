`timescale 1ns/1ns

module gen_dff_test_bench;
    reg gen_pipe_dff_1_clk;
    reg gen_pipe_dff_1_rst_;
    reg[31:0] gen_pipe_dff_1_default_val;
    reg[31:0] gen_pipe_dff_1_d_i;
    wire[31:0] gen_pipe_dff_1_q_o;

    gen_pipe_dff gen_pipe_dff_1 (
        .clk  (gen_pipe_dff_1_clk),
        .rst_ (gen_pipe_dff_1_rst_),
        .default_val(gen_pipe_dff_1_default_val),
        .d_i(gen_pipe_dff_1_d_i),
        .q_o(gen_pipe_dff_1_q_o)
    );

    initial begin
        #0 begin
            gen_pipe_dff_1_clk <= 1'b1;
            gen_pipe_dff_1_rst_ <= 0;
            gen_pipe_dff_1_default_val <= 32'hDEADBEEF;
        end

        // TIME 1
        #1 begin
            if (gen_pipe_dff_1_q_o == 32'hDEADBEEF) begin
                $display("[TIME ", $time, "] OK");
            end else begin
                $display("[TIME ", $time, "] NG");
            end
        end

        // TIME 2
        #1 begin
            gen_pipe_dff_1_rst_ <= 1;
            gen_pipe_dff_1_d_i <= 32'h42;
        end

        // TIME 3
        #1 begin
            if (gen_pipe_dff_1_q_o == 32'h42) begin
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
        gen_pipe_dff_1_clk <= ~gen_pipe_dff_1_clk;
    end

    initial begin
        $dumpfile("gen_pipe_dff.vcd");
        $dumpvars(0, gen_pipe_dff_1);
    end

endmodule