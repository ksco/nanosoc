IVERILOG = iverilog -s $@_test_bench -o $@_tb.out testbench/$@_tb.v
VVP = vvp $@_tb.out

core_modules = id if_id pcreg regs ex
perips_modules = ram
utils_modules = gen_dff

require_gen_dff = if_id

all: test

test: $(utils_modules) $(core_modules) $(perips_modules)

$(core_modules):
	${IVERILOG} core/$@.v $$(echo $(require_gen_dff) | grep -w -q $@ && echo utils/gen_dff.v)
	${VVP}

$(perips_modules):
	${IVERILOG} perips/$@.v
	${VVP}

$(utils_modules):
	${IVERILOG} utils/$@.v
	${VVP}

clean:
	rm -rf *.out
	rm -rf *.vcd
