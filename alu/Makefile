all: run

run: alu_tb
	make alu
	make alu_tb
	ghdl -r alu_tb --stop-time=$(TIME)ns --vcd=alu.vcd
	gtkwave alu.vcd 

alu_tb: alu_tb.vhdl
	ghdl -a --ieee=synopsys -fexplicit alu.vhdl alu_tb.vhdl
	ghdl -e --ieee=synopsys -fexplicit alu_tb	

alu: alu.vhdl
	ghdl -a --ieee=synopsys -fexplicit alu.vhdl

clean: 
	rm -rf *.o
	rm -rf *.cf
	rm -rf *.vcd
