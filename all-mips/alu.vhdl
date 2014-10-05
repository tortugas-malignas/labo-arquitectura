library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity alu is
port(
	a, b : in std_logic_vector(31 downto 0);
	alucontrol : in std_logic_vector(2 downto 0);
	zero : out std_logic;
	result : out std_logic_vector(31 downto 0) 
);
end entity;
architecture alu_1 of alu is
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

    signal alucontrol_s: std_logic_vector(2 downto 0);
    signal result_s: std_logic_vector(31 downto 0);
begin
    PROCESS (a, b, alucontrol)
       BEGIN 
		
         CASE alucontrol IS
	   	 	WHEN "000" => result_s <= a and b;
           	WHEN "001" => result_s <= a or b;
           	WHEN "010" => result_s <= a + b;
           -- WHEN "011" => result <= nl;
			WHEN "100" => result_s <= a and (not b);
			WHEN "101" => result_s <= a or (not b);
			WHEN "110" => result_s <= a - b;
			WHEN "111" => result_s <= slt(a,b); 
           WHEN OTHERS => null;
         END CASE;
		IF (result_s=(X"00000000")) THEN
			zero <= '1';
		ELSE 
			zero <= '0';
		END IF;

    END PROCESS;
    result <= result_s;
 
end architecture;
