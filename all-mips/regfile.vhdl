library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;  
use IEEE.STD_LOGIC_ARITH.all;


entity regfile is
port(
	clk, we3 : in std_logic;
	ra1, ra2, wa3 : in std_logic_vector(4 downto 0);
	wd3 : in std_logic_vector(31 downto 0);
	rd1, rd2 : out std_logic_vector(31 downto 0)
);
end entity;
architecture fileregister_1 of regfile is
begin
	process(clk)
		-- memoria : matriz 32x1, donde cada elemento contiene 32 bits
		type ramtype is array (31 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
    	variable mem_reg : ramtype;
		variable index_mem1, index_mem2 : integer;
		variable index_i : integer ;
		begin
			-- and clk = 1 ? 
			if(clk'event) then
				-- escribimos los datos wd3 en el registro wa3
				if(we3='1') then
					index_i := conv_integer(wa3);
					mem_reg(index_i):= wd3;
					assert false report integer'image(index_i) severity note;
				else -- leemos los datos de los registros ra1 ra2
					index_mem1 := conv_integer(ra1);
					index_mem2 := conv_integer(ra2);

					if(index_mem1=0) then
						rd1 <= (others=>'0');
                    else
                        rd1 <= mem_reg(index_mem1);
                    end if;
					if(index_mem2=0) then
						rd2 <= (others=>'0');
                    else
                        rd2 <= mem_reg(index_mem2);
					end if;
				end if;
			end if;

	end process;
	
end architecture;
