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
begin

    dp: datapath port map(MemToReg => MemToReg_s, MemWrite => MemWrite_s,
                          Branch => Branch_s, AluSrc => AluSrc_s,
                          RegDst => RegDst_s, RegWrite => RegWrite_s,
                          Jump => Jump_s, AluControl => AluControl_s,
                          instr => instr_s, pc => pc_s,clk => clk_s,
                          reset => reset_s, dump => dump_s);
    control: controller port map(Op => instr_s(31 downto 26), Funct => instr_s(5 downto 0),
                                 MemToReg => MemToReg_s, MemWrite => MemWrite_s,
                                 Branch => Branch_s, AluSrc => AluSrc_s,
                                 RegDst => RegDst_s, RegWrite => RegWrite_s,
                                 Jump => Jump_s, AluControl => AluControl_s);
    -- I'm tha boss!
end behaviour;
