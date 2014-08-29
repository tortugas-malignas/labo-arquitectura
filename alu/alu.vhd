library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity alu is
    port(a: in std_logic_vector(31 downto 0);
         b: in std_logic_vector(31 downto 0);
         alucontrol: in std_logic_vector(2 downto 0);
         zero: out std_logic;
         result: out std_logic_vector(31 downto 0));
end alu;

architecture behaviour of alu is
    signal result_s: std_logic_vector(31 downto 0);
begin
    process(a,b,alucontrol)
    begin
        case alucontrol is
            when "000" => result_s <= a and b;
            when "001" => result_s <= a or b;
            when "010" => result_s <= a + b;
            when "100" => result_s <= a and not(b);
            when "101" => result_s <= a or not(b);
            when "110" => result_s <= a - b;
            when "111" => if a < b then result_s(31 downto 0) <= (others => '1'); else result_s(31 downto 0) <= (others =>'0'); end if;
            when others => result_s <= (others => '0');
        end case;
        if result_s=X"00000000" then zero <= '1'; else zero <= '0'; end if;
        result <= result_s;
    end process;
end behaviour;
