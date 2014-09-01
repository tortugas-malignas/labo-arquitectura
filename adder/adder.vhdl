library ieee;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;


entity adder is
  port(
  a, b:	in std_logic_vector(31 downto 0);
  y:	out std_logic_vector(31 downto 0)
  );
end entity;

architecture sum_32 of adder is
begin
  y <= (a + b);
end sum_32;
