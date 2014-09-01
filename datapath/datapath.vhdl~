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

mux_pcsrc : component mux2 is
	generic (NBITS : natural := 32);
	port(
		d0, d1 : in std_logic_vector(NBITS-1 downto 0);
		s : in std_logic;
		y : out std_logic_vector(NBITS-1 downto 0)
	);
end component;

mux_jump : component mux2 is
	generic (NBITS : natural := 32);
	port(
		d0, d1 : in std_logic_vector(NBITS-1 downto 0);
		s : in std_logic;
		y : out std_logic_vector(NBITS-1 downto 0)
	);
end component;

mux_regdst : component mux2 is
	generic (NBITS : natural := 32);
	port(
		d0, d1 : in std_logic_vector(NBITS-1 downto 0);
		s : in std_logic;
		y : out std_logic_vector(NBITS-1 downto 0)
	);
end component;

mux_alusrc : component mux2 is
	generic (NBITS : natural := 32);
	port(
		d0, d1 : in std_logic_vector(NBITS-1 downto 0);
		s : in std_logic;
		y : out std_logic_vector(NBITS-1 downto 0)
	);
end component;

mux_memtoreg : component mux2 is
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

pc_next : component adder is 
	port(
	  a, b:	in std_logic_vector(31 downto 0);
	  y:	out std_logic_vector(31 downto 0)
	  );
end component;

pc_jump : component adder is 
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
		zero : out bit;
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

begin

end architecture;

