------------------ Libraries ------------------
library ieee;
use ieee.std_logic_1164.all;

entity shifter_2b_tb is
end shifter_2b_tb;

architecture behaviour of shifter_2b_tb is
    component shifter_2b is
        port(a: in std_logic_vector(31 downto 0);
             y: out std_logic_vector(31 downto 0));
    end component;

    signal a_s: std_logic_vector(31 downto 0);
    signal y_s: std_logic_vector(31 downto 0);
begin
    shifter: shifter_2b port map (a => a_s, y => y_s); 
    process
    begin
        a_s <= "11111111111111111111111111111111";
        wait for 1 ns;
        assert(y_s="11111111111111111111111111111100")
        report "Mmmmmm.. nop";
        wait for 1 ns;

        assert(false)
        report "Done";
    end process;
end behaviour;
