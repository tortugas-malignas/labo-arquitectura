-------------------------------------------------------------------------------
--
-- Title       : dmem
-- Design      : Mips
-- Author      : Eduardo Sanchez
-- Company     : Famaf
--
-------------------------------------------------------------------------------
--
-- File        : dmem.vhd
--
-------------------------------------------------------------------------------
--
-- Description : Archivo con el dise�o de la memoria RAM del procesador MIPS.
-- Para mantener un dise�o corto, la memoria solo contiene 64 palabras de 
-- 32 bits c/u (aunque podria direccionar mas memoria)
-- dump: si esta se�al esta activa (1), se copia le contenido de la memoria
-- en el archivo de salida DUMP (para su posterior revision).
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use STD.TEXTIO.all;
use IEEE.STD_LOGIC_SIGNED.all;

library WORK;
use WORK.components.all;

entity dmem is -- data memory
  port(clk, we:  in STD_LOGIC;
       a, wd:    in STD_LOGIC_VECTOR(31 downto 0);
       rd:       out STD_LOGIC_VECTOR(31 downto 0);
       dump: in STD_LOGIC
		 );
end;

architecture behave of dmem is
 constant MAX_BOUND: Integer := 64;
 
 type ramtype is array (MAX_BOUND-1 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
 signal mem: ramtype;

 procedure memDump is
   file dumpfile : text open write_mode is MEMORY_DUMP_FILE;
   variable dumpline : line;
   variable i: natural := 0;
   begin
		write(dumpline, string'("Memoria RAM de Mips:"));
		writeline(dumpfile,dumpline);
		write(dumpline, string'("Address Data"));
		writeline(dumpfile,dumpline);
      while i <= MAX_BOUND-1 loop        
		  write(dumpline, i);
		  write(dumpline, string'(" "));
		  write(dumpline, conv_integer(mem(i)));		  
		  writeline(dumpfile,dumpline);
        i:=i+1;
      end loop;
   end procedure memDump;

begin
   process(clk, a, mem)
	begin 
	  if clk'event and clk = '1' and we = '1' then
				mem(conv_integer(a(7 downto 2))) <= wd;
	  end if;
	   rd <= mem(conv_integer(a(7 downto 2))); -- word aligned
	end process;
	
	process(dump)
	begin
	 if dump = '1' then
	   memDump;
	 end if;
	end process;
end;
