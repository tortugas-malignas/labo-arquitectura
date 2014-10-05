library ieee;
use ieee.std_logic_1164.all;


entity aludec is
port(
	funct: in std_logic_vector(5 downto 0);
	aluop : in std_logic_vector(1 downto 0);
	alucontrol : out std_logic_vector(2 downto 0)
);
end entity;
architecture aludecoder_1 of aludec is
signal control : std_logic_vector(2 downto 0);
begin
	process(funct, aluop)
		begin
			if(aluop="00") then
				control <= "010";
			elsif(aluop="01") then
				control <= "110";
			else 
				CASE funct IS
					WHEN "100000" => control <= "010";
					WHEN "100010" => control <= "110";
					WHEN "100100" => control <= "000";
					WHEN "100101" => control <= "001";
					WHEN "101010" => control <= "111";	   
					WHEN OTHERS => null;
				END CASE;
			end if;
	end process;
    alucontrol <= control;
	
end architecture;
