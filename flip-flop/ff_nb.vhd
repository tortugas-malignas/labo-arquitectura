----------- Libraries  --------------------
library ieee;
use ieee.std_logic_1164.all;

----------- Entity   ---------------------
entity ff_nb is
    -- Seteamos la cantidad de bits que 
    -- toma el flip flop.
    generic(n: natural :=2);

    -- Seteamos los puertos
    port( d:        in std_logic_vector(n-1 downto 0);
          reset:    in std_logic;
          clock:    in std_logic;
          q:        out std_logic_vector(n-1 downto 0)
      );
end ff_nb;


---------- Architecture --------------------
architecture first of ff_nb is

begin
    -- Empieza el proceso del clock
    process (clock, reset) 
    begin
        if (reset = '1') then
            -- Resetea
            q <= (others => '0');
        elsif (clock'event and clock = '1') then
            -- Pone todo lo de la entrada d en q
            q <= d;
        end if;
    end process;
end architecture;
