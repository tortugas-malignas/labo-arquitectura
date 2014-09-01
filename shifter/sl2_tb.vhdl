library ieee;
use ieee.std_logic_1164.all;

entity sl2_tb is

end entity;
architecture tb1 of sl2_tb is
component sl2 is 
port(
	a : in std_logic_vector(31 downto 0);
	y : out std_logic_vector(31 downto 0)
);
end component;
signal in_a, out_y : std_logic_vector(31 downto 0);
begin
  mapping: sl2 port map(a=> in_a, y=> out_y);
  process
   	begin
   
	in_a <= (others=>'1');
    wait for 10 ns;
	in_a <= X"00000001";
    wait for 10 ns;
  end process;

end architecture;



