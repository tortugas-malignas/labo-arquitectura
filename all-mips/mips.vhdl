library ieee;
use ieee.std_logic_1164.all;

entity mips is
    port(reset: in std_logic;
         clk:   in std_logic;
         dump:  in std_logic;
         instr: out std_logic_vector(31 downto 0);
         pc:    out std_logic_vector(31 downto 0));
end mips;

architecture behaviour of mips is
    signal instr_s, pc_s: std_logic_vector(31 downto 0);
    signal MemToReg_s, MemWrite_s, Branch_s, AluSrc_s, RegDst_s, RegWrite_s, Jump_s: std_logic;
    signal AluControl_s: std_logic_vector(2 downto 0);
    signal dump_s, clk_s, reset_s: std_logic;
    component datapath is
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
    end component;
    component controller is
    port(
        Op, Funct:          in  STD_LOGIC_VECTOR(5 downto 0);
        MemToReg, MemWrite: out STD_LOGIC;
        AluSrc:      		out STD_LOGIC;
        RegDst, RegWrite:   out STD_LOGIC;
        Jump:               out STD_LOGIC;		 
        Branch: 			out STD_LOGIC;
        AluControl:         out STD_LOGIC_VECTOR(2 downto 0)
    );
    end component;
begin
    dp: datapath port map(MemToReg => MemToReg_s, MemWrite => MemWrite_s,
                          Branch => Branch_s, AluSrc => AluSrc_s,
                          RegDst => RegDst_s, RegWrite => RegWrite_s,
                          Jump => Jump_s, AluControl => AluControl_s,
                          instr => instr_s, pc => pc_s,clk => clk,
                          reset => reset, dump => dump);
    control: controller port map(Op => instr_s(31 downto 26), Funct => instr_s(5 downto 0),
                                 MemToReg => MemToReg_s, MemWrite => MemWrite_s,
                                 Branch => Branch_s, AluSrc => AluSrc_s,
                                 RegDst => RegDst_s, RegWrite => RegWrite_s,
                                 Jump => Jump_s, AluControl => AluControl_s);
    pc <= pc_s;
    instr <= instr_s;
end behaviour;
