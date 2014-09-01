library ieee;
use ieee.std_logic_1164.all;


entity signext_tb is

end entity;
architecture test_signext of signext_tb is
component signext
port(
	a : in std_logic_vector(15 downto 0);
	y : out std_logic_vector(31 downto 0)
);
end component;
signal in_a : std_logic_vector(15 downto 0);
signal out_y : std_logic_vector(31 downto 0);

begin
	mapping: signext port map(a=> in_a, y=> out_y);
	process
		begin
		in_a <= X"F000";
		wait for 10 ns;
		in_a <= X"0FFF";
		wait for 10 ns;

	end process;
	
end architecture;


