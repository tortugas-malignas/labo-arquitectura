library ieee;
use ieee.std_logic_1164.all;

entity signext_tb is
end signext_tb;

architecture behaviour of signext_tb is
    component signext is
        port (a: in std_logic_vector(15 downto 0);
              y: out std_logic_vector(31 downto 0));
    end component;
    
    signal a_s: std_logic_vector(15 downto 0);
    signal y_s: std_logic_vector(31 downto 0);
begin
    conv: signext port map(a => a_s, y => y_s);
    process
    begin
        a_s <= X"FFFF";
        wait for 2 ns;
        assert(y_s=X"FFFFFFFF") report "test 1 fail";
        wait for 2 ns;
        a_s <= "1010000000001000";
        wait for 2 ns;
        assert(y_s="11111111111111111010000000001000") report "test 2 fail";
    end process;
end behaviour;
