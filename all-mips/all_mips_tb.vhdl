library ieee;
use ieee.std_logic_1164.all;

entity all_mips_tb is
end entity;

architecture test_mips of all_mips_tb is
    component mips
    port(reset: in std_logic;
         clk:   in std_logic;
         dump:  in std_logic;
         instr: out std_logic_vector(31 downto 0);
         pc:    out std_logic_vector(31 downto 0));
    end component;

    signal reset_s: std_logic;
    signal clk_s:   std_logic;
    signal dump_s:  std_logic;
    signal instr_s: std_logic_vector(31 downto 0);
    signal pc_s:    std_logic_vector(31 downto 0);

begin
    mapping: mips port map(reset => reset_s, clk => clk_s, dump => dump_s,
                           instr => instr_s, pc => pc_s);

    process
    begin
        clk_s <= '1';
        wait for 10 ns;
        clk_s <= '0';
        wait for 10 ns;
    end process;

    process
    begin
        dump_s <= '0';
        reset_s <= '1';
        wait for 20 ns;
        reset_s <= '0';
        wait for 170 ns;
        dump_s <= '1';
        wait for 40 ns;
    end process;

end architecture;
