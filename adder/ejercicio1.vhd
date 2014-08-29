library ieee;
use ieee.std_logic_1164.all;

entity adder_32b is
    port (a, b : in std_logic_vector(31 downto 0);
          y: out std_logic_vector(31 downto 0));
end adder_32b;
 
architecture simple of adder is
begin
    y <= (a xor b)
end simple;
