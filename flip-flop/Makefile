all: run

run: ff_nb_tb
	ghdl -r ff_nb_tb --stop-time=50ns --vcd=ff_nb.vcd

ff_nb_tb: ff_nb ff_nb_tb.vhd
	ghdl -a ff_nb_tb.vhd
	ghdl -e ff_nb_tb	

ff_nb: ff_nb.vhd
	ghdl -a ff_nb.vhd

spawn: run
	gtkwave ff_nb.vcd

clean: 
	rm -rf ff_nb_tb
	rm -rf *.o
	rm -rf *.cf
	rm -rf *.vcd
