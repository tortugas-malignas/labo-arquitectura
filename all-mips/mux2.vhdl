library ieee;
use ieee.std_logic_1164.all;

entity mux2 is
generic (NBITS : natural := 32);
port(
	d0, d1 : in std_logic_vector(NBITS-1 downto 0);
	s : in std_logic;
	y : out std_logic_vector(NBITS-1 downto 0)
);
end entity;
architecture mux_nbits_1 of mux2 is
begin 
process(d0, d1, s)
	begin
	if(s='0') then
		y <= d0;
	elsif (s='1') then
		y<=d1;
	end if;
end process;
end architecture;
