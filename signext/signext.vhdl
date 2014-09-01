library ieee;
use ieee.std_logic_1164.all;


entity signext is
port(
	a : in std_logic_vector(15 downto 0);
	y : out std_logic_vector(31 downto 0)
);
end entity;
architecture signext_1 of signext is

	function sign_extend (
	narrow_bus: std_logic_vector(15 downto 0)
	)
	return std_logic_vector is
		variable output: std_logic_vector(31 downto 0);
	begin

	output(15 downto 0) := narrow_bus(15 downto 0);
	
	output(31 downto 16) := (others => narrow_bus(15));
	
	return output;

	end sign_extend;

begin
	y <= sign_extend(a);
end architecture;


