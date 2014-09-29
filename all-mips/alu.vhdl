library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity alu is
port(
	a, b : in std_logic_vector(31 downto 0);
	alucontrol : in std_logic_vector(2 downto 0);
	zero : out bit;
	result : out std_logic_vector(31 downto 0) 
);
end entity;
architecture alu_1 of alu is
SIGNAL reg1, reg2: 	UNSIGNED(a'range);
SIGNAL result_buf:	std_logic_vector(31 downto 0);

	function slt(
		fvalue : std_logic_vector(31 downto 0);
		svalue : std_logic_vector(31 downto 0)
	) return std_logic_vector is 
		variable output : std_logic_vector(31 downto 0);
	begin
		if(fvalue - svalue < 0) then 
			output := (others=>'1');
		else 
			output := (others=>'0');
		end if;
	return output;
	end slt;

begin
PROCESS (a, b, alucontrol)
       BEGIN 
		
         CASE alucontrol IS
	   	 	WHEN "000" => result_buf <= a and b;
           	WHEN "001" => result_buf <= a or b;
           	WHEN "010" => result_buf <= a + b;
           -- WHEN "011" => result <= null;
			WHEN "100" => result_buf <= a and (not b);
			WHEN "101" => result_buf <= a or (not b);
			WHEN "110" => result_buf <= a - b;
			WHEN "111" => result_buf <= slt(a,b); 
           WHEN OTHERS => null;
         END CASE;
		IF (result_buf=(X"00000000")) THEN
			zero <= '1';
		ELSE 
			zero <= '0';
		END IF;
		result <= result_buf;

END PROCESS;
 
end architecture;
