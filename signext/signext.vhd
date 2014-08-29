library ieee;
use ieee.std_logic_1164.all;

entity signext is
    port (a: in std_logic_vector(15 downto 0);
          y: out std_logic_vector(31 downto 0));
end signext;

architecture behaviour of signext is
begin
    process(a)
    begin
        for I in a'left downto a'right loop
            y(I) <= a(I);
        end loop;
        y(31 downto 16) <= (others => a(15));
    end process;
end behaviour;
