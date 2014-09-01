library ieee;
use ieee.std_logic_1164.all;

entity adder_tb is
end entity;
architecture test_a of adder_tb is
    component adder is
  	port(
  	a, b:	in std_logic_vector(31 downto 0);
  	y:	out std_logic_vector(31 downto 0)
  	);
    end component;
signal A, B, sum : std_logic_vector(31 downto 0);
begin
  mapping: adder port map(A, B, sum);

  process
   	begin
   	--TEST 1
	A <= (others=>'0');
    B <= (others => '1');
    wait for 10 ns;
    
  end process;
      

end architecture;
