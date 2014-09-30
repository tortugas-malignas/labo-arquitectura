SRC= adder.vhdl aludec.vhdl alu.vhdl components.vhdl controller.vhdl datapath.vhdl \
	dmem.vhdl flopr.vhdl imem.vhdl maindec.vhdl mips.vhdl mux2.vhdl regfile.vhdl signext.vhdl sl2.vhdl 
OBJECTS=$(SRC:.vhdl=.o)


all: all_mips_tb
	ghdl -r all_mips_tb --vcd=all_mips_tb.vcd --stop-time=250ns

all_mips_tb: $(SRC)
	ghdl -a --ieee=synopsys -fexplicit $(SRC) all_mips_tb.vhdl
	ghdl -e --ieee=synopsys -fexplicit all_mips_tb 

%.o: %.vhdl
	ghdl -a --ieee=synopsys -fexplicit $<

clean:
	rm -f *.o
	rm -f *.cf
