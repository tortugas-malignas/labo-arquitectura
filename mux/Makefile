all: run

run: mux_tb
	ghdl -r mux_tb --stop-time=50ns --vcd=mux.vcd

mux_tb: mux mux_tb.vhd
	ghdl -a mux_tb.vhd
	ghdl -e mux_tb	

mux: mux.vhd
	ghdl -a mux.vhd

spawn: run
	gtkwave mux.vcd

clean: 
	rm -rf mux_tb
	rm -rf *.o
	rm -rf *.cf
	rm -rf *.vcd
