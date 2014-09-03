library ieee;
use ieee.std_logic_1164.all;

entity datapath is
	port(  
		 clk, reset:        in  STD_LOGIC;
         MemToReg, Branch:   in  STD_LOGIC;
         AluSrc, RegDst:    in  STD_LOGIC;
         RegWrite, Jump:    in  STD_LOGIC;
         AluControl:        in  STD_LOGIC_VECTOR(2 downto 0);
         pc:                out STD_LOGIC_VECTOR(31 downto 0);
         instr:             out  STD_LOGIC_VECTOR(31 downto 0);
         MemWrite: 			  in STD_LOGIC;
         dump:				  in STD_LOGIC
	);
end entity;

architecture behaviour_1 of datapath is

component mux2 is
	generic (NBITS : natural := 32);
	port(
		d0, d1 : in std_logic_vector(NBITS-1 downto 0);
		s : in std_logic;
		y : out std_logic_vector(NBITS-1 downto 0)
	);
end component;


component flopr is
	generic (N : natural := 32);
	port(
		d : in std_logic_vector(N-1 downto 0);
		clk, reset : in std_logic;
		q : out std_logic_vector(N-1 downto 0)
	);
end component;

component imem is 
  port(a:  in  STD_LOGIC_VECTOR(5 downto 0);
       rd: out STD_LOGIC_VECTOR(31 downto 0));
end component;

component adder is 
	port(
	  a, b:	in std_logic_vector(31 downto 0);
	  y:	out std_logic_vector(31 downto 0)
	  );
end component;

component regfile is
	port(
		clk, we3 : in std_logic;
		ra1, ra2, wa3 : in std_logic_vector(4 downto 0);
		wd3 : in std_logic_vector(31 downto 0);
		rd1, rd2 : out std_logic_vector(31 downto 0)
	);
end component;

component signext is 
	port(
		a : in std_logic_vector(15 downto 0);
		y : out std_logic_vector(31 downto 0)
	);
end component;

component sl2 is
	generic(SHIFT: natural:=2);
	port(
		a : in std_logic_vector(31 downto 0);
		y : out std_logic_vector(31 downto 0)
	);
end component;

component alu is
	port(
		a, b : in std_logic_vector(31 downto 0);
		alucontrol : in std_logic_vector(2 downto 0);
		zero : out std_logic;
		result : out std_logic_vector(31 downto 0) 
	);
end component;

component dmem is 
  port(clk, we:  in STD_LOGIC;
       a, wd:    in STD_LOGIC_VECTOR(31 downto 0);
       rd:       out STD_LOGIC_VECTOR(31 downto 0);
       dump: in STD_LOGIC
		 );
end component;


signal instrPrima : std_logic_vector(31 downto 0);
signal PCPlus4 : std_logic_vector(31 downto 0);
signal Zero : std_logic;

signal PCJump : std_logic_vector(31 downto 0) := PCPlus4(31 downto 28) and instrPrima(25 downto 0) and "00";
signal PCSrc : std_logic := Branch and Zero;
signal PCNext : std_logic_vector(31 downto 0);
signal PCSrc_signal0, PCBranch : std_logic_vector(31 downto 0);
signal PCprima : std_logic_vector(31 downto 0);
signal WriteReg : std_logic_vector(4 downto 0);
signal Result : std_logic_vector(31 downto 0);
signal SRCa, SrcB, WriteData : std_logic_vector(31 downto 0);
signal SignImm : std_logic_vector(31 downto 0);

signal ShifterAdder : std_logic_vector(31 downto 0);
signal AluResult : std_logic_vector(31 downto 0);
signal ReadData : std_logic_vector(31 downto 0);
begin
	PCSrc_mux : mux2 port map(d0=> PCSrc_signal0, d1=> PCBranch, s=> PCSrc, y=> PCNext);
	PCJump_mux : mux2 port map(d0=> PCNext, d1=> PCJump, s=> Jump, y=> PC);
	PC_ff : flopr port map(d=>PCprima, clk=> clk, reset=> reset, q=>PCprima);
-- check!
	Imem_instance : imem port map(a=> PCprima(5 downto 0), rd=>instr);
	PCPlus_adder : adder port map(a=>PCprima, b=>X"00000004", y=> PCPlus4);
	regfile_instance : regfile port map(clk=> clk , we3=> RegWrite , ra1=> instrPrima(25 downto 21), ra2=> instrPrima(20 downto 16), 
		wa3=> WriteReg, wd3=> Result, rd1=> SRCa, rd2=> WriteData);
	signext_instan : signext port map(a=>instrPrima(15 downto 0), y=> SignImm);
	writeReg_mux : mux2
		generic map (NBITS => 5)
		port map(d0=>instrPrima(20 downto 16), d1=>instrPrima(15 downto 11), s=>RegDst, y=> WriteReg);
	AluIn : mux2 port map(d0=>WriteData, d1=> SignImm, y=> SrcB, s=>AluSrc);
	Sl2_adder : sl2 port map(a=>SignImm, y=>ShifterAdder);
	AdderBranch : adder port map(a=>ShifterAdder, b=>PCSrc_signal0, y=>PCBranch);
	AluInstance : alu port map(a=>SRCa, b=>SrcB, alucontrol=> AluControl, zero=> Zero, result=>AluResult);
	MemoryData : dmem port map(clk=>clk, we=>MemWrite, a=>AluResult, wd=> WriteData, rd=> ReadData, dump=>dump);
	MemDataMux : mux2 port map(d0=>AluResult, d1=>ReadData, s=>MemToReg, y=>Result);


end architecture;

