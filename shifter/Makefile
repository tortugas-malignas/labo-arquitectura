all: run

run: sl2_tb
	make shiftl
	make shift_tb
	ghdl -r sl2_tb --stop-time=50ns --vcd=sl2.vcd
	gtkwave sl2.vcd 

shift_tb: sl2_tb.vhdl
	ghdl -a --ieee=synopsys -fexplicit sl2.vhdl sl2_tb.vhdl
	ghdl -e --ieee=synopsys -fexplicit sl2_tb	

shiftl: sl2.vhdl
	ghdl -a --ieee=synopsys -fexplicit sl2.vhdl

clean: 
	rm -rf *.o
	rm -rf *.cf
	rm -rf *.vcd
