SRC= adder.vhdl aludec.vhdl alu.vhdl components.vhdl controller.vhdl datapath.vhdl \
	dmem.vhdl flopr.vhdl imem.vhdl maindec.vhdl mips.vhdl mux2.vhdl regfile.vhdl signext.vhdl sl2.vhdl 
OBJECTS=$(SRC:.vhdl=.o)

all: $(SRC)
	ghdl -a --ieee=synopsys -fexplicit $(SRC) mips_tb.vhdl
	ghdl -e --ieee=synopsys -fexplicit mips_tb 


vcd: all
	ghdl -r mips_tb --vcd=mips_tb.vcd --stop-time=2200ns

%.o: %.vhdl
	ghdl -a --ieee=synopsys -fexplicit $<

clean:
	rm -f *.o
	rm -f *.cf
	rm -f *.vcd
	rm -f mips_tb
