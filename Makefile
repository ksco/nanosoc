all: pc_reg regs gen_dff if_id id ram

pc_reg:
	iverilog -s pc_reg_test_bench -o pcreg_tb.out testbench/pcreg_tb.v core/pcreg.v
	vvp pcreg_tb.out

regs:
	iverilog -s regs_test_bench -o regs_tb.out testbench/regs_tb.v core/regs.v
	vvp regs_tb.out

gen_dff:
	iverilog -s gen_dff_test_bench -o gen_dff_tb.out testbench/gen_dff_tb.v utils/gen_dff.v
	vvp gen_dff_tb.out

if_id:
	iverilog -s if_id_test_bench -o if_id_tb.out testbench/if_id_tb.v core/if_id.v utils/gen_dff.v
	vvp if_id_tb.out

id:
	iverilog -s id_test_bench -o id_tb.out testbench/id_tb.v core/defines.v core/id.v
	vvp id_tb.out

ram:
	iverilog -s ram_test_bench -o ram_tb.out testbench/ram_tb.v perips/ram.v
	vvp ram_tb.out

clean:
	rm -rf *.out
	rm -rf *.vcd

.PHONY: all clean