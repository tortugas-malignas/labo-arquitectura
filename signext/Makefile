all:
	ghdl -a signext.vhd
	ghdl -a signext_tb.vhd
	ghdl -e signext_tb

test:
	ghdl -r signext_tb --stop-time=6ns --vcd=signext.vcd

clean: 
	rm -rf ff_nb_tb
	rm -rf *.o
	rm -rf *.cf
	rm -rf *.vcd
