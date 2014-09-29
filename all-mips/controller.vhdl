library ieee;
use ieee.std_logic_1164.all;

entity controller is
port(
	Op, Funct:          in  STD_LOGIC_VECTOR(5 downto 0);
	MemToReg, MemWrite: out STD_LOGIC;
    AluSrc:      		out STD_LOGIC;
    RegDst, RegWrite:   out STD_LOGIC;
    Jump:               out STD_LOGIC;		 
    Branch: 			out STD_LOGIC;
	AluControl:         out STD_LOGIC_VECTOR(2 downto 0)
);
end entity;

architecture controller_1 of controller is
component maindec is
	port(
		Op:                 in  STD_LOGIC_VECTOR(5 downto 0);
       	MemToReg, MemWrite: out STD_LOGIC;
       	Branch, AluSrc:     out STD_LOGIC;
       	RegDst, RegWrite:   out STD_LOGIC;
       	Jump:               out STD_LOGIC;
       	AluOp:              out  STD_LOGIC_VECTOR(1 downto 0)
	);
end component;
component aludec is
	port(
	funct: in std_logic_vector(5 downto 0);
	aluop : in std_logic_vector(1 downto 0);
	alucontrol : out std_logic_vector(2 downto 0)
	);
end component;
signal alucontrol_signal : std_logic_vector(1 downto 0);
begin
	maindec_instance : maindec port map(Op=>Op, MemToReg=>MemToReg, MemWrite=>MemWrite, Branch=>Branch,
		AluSrc=>AluSrc,RegDst=> RegDst, RegWrite=>RegWrite, Jump=>Jump, AluOp =>alucontrol_signal);
	aludecoder_instance : aludec port map(funct=>Funct, aluop=>alucontrol_signal, alucontrol=>AluControl);	

end architecture;




