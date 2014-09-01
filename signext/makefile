all: run

run: signext_tb
	make signext
	make signext_tb
	ghdl -r signext_tb --stop-time=$(TIME)ns --vcd=signext.vcd
	gtkwave signext.vcd 

signext_tb: signext_tb.vhdl
	ghdl -a --ieee=synopsys -fexplicit signext.vhdl signext_tb.vhdl
	ghdl -e --ieee=synopsys -fexplicit signext_tb

signext: signext.vhdl
	ghdl -a --ieee=synopsys -fexplicit signext.vhdl

clean: 
	rm -rf *.o
	rm -rf *.cf
	rm -rf *.vcd
