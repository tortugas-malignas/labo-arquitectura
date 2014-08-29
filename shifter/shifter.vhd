------------------ Libraries ------------------
library ieee;
use ieee.std_logic_1164.all;

------------------ Entity ---------------------
entity shifter_2b is
    -- puertos
    port(a: in std_logic_vector(31 downto 0);
         y: out std_logic_vector(31 downto 0));
end shifter_2b;

----------------- Architecture --------------

architecture behaviour of shifter_2b is
begin
    process(a)
    begin
        for I in 31 downto 2 loop
            y(I) <= a(I-2);
        end loop;
        y(1) <= '0';
        y(0) <= '0';
    end process;
end architecture;
