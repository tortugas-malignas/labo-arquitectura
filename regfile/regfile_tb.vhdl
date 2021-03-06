library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;  
use IEEE.STD_LOGIC_ARITH.all;


entity regfile_tb is
end entity;
architecture testbrench_regfile_1 of regfile_tb is
component regfile is
	port(
	clk, we3 : in std_logic;
	ra1, ra2, wa3 : in std_logic_vector(4 downto 0);
	wd3 : in std_logic_vector(31 downto 0);
	rd1, rd2 : out std_logic_vector(31 downto 0)
	);
end component;

signal clock, is_write : std_logic;
signal wdata, outdata1, outdata2  : std_logic_vector(31 downto 0);
signal reg1, reg2, reg3 : std_logic_vector(4 downto 0);

begin
	mapping_1: regfile port map(clk => clock, we3 => is_write, wd3 => wdata, ra1=>reg1, ra2=>reg2, 
				wa3=>reg3, rd1=>outdata1, rd2=>outdata2);
	
 	clock_process: process
		begin
		clock<= '1';
		is_write <= '1';
		wait for 10 ns;
		clock<= '0';
		is_write <= '0';
		wait for 10 ns;
	end process;

	write_test : process
		begin
		wdata <= X"00000007";
		reg3 <= "00011";
			
		wait for 10 ns;

		reg1<= "00011";		
		reg2<= "00000";
		assert reg1=outdata1
			report "out data error" severity error;
		assert false report "end test" severity note;
	end process;


end architecture;
