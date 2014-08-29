library ieee;
use ieee.std_logic_1164.all;

entity mux is
    port( d0: in std_logic_vector(31 downto 0);
          d1: in std_logic_vector(31 downto 0);
          s: in std_logic;
          y: out std_logic_vector(31 downto 0)
      );
end mux;

---------- Architecture ------------

architecture behv of mux is
begin
    process(d0, d1, s)
    begin
        if(s = '0') then
            y <= d0;
        else
            y <= d1;
        end if;
    end process;
end behv;
