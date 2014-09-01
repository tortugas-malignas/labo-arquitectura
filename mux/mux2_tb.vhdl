library IEEE; 
use IEEE.std_logic_1164.all; 

  --*************************=***************************************** 
  --                           E N T I T Y 
  --*************************=***************************************** 
entity mux2_tb is 
	generic(NBITS : natural := 32);
end entity; 

architecture mux_tb_1 of mux2_tb is 
    
    constant TRDELAY_C       : time := 5 ns; 
    constant TRHOLD_C        : time := 3 ns; 

  
     signal a                : std_logic_vector(NBITS -1 downto 0); 
     signal b                : std_logic_vector(NBITS-1 downto 0); 
     signal sel              : std_logic; 
     signal mux_out          : std_logic_vector(NBITS-1 downto 0);
    -------------------------=----------------------------------------- 
    -- component 
    -------------------------=----------------------------------------- 
    component multiplexor_n
		generic (NBITS : natural := 32);
		port(
			d0, d1 : in std_logic_vector(NBITS-1 downto 0);
			s : in std_logic;
			y : out std_logic_vector(NBITS-1 downto 0)
		);
    end component; 

  begin 
    -------------------------=----------------------------------------- 
    -- component instantiations 
    -------------------------=----------------------------------------- 
    mux_ins : multiplexor_n
		--GENERIC MAP(N=>32)
      	port map 
      	( 
		    d0 => a, 
		    d1 => b,
		    s => sel,
			y => mux_out
		); 
  
    -------------------------=----------------------------------------- 
    -- A_process: process to drive the input signal A
    -------------------------=----------------------------------------- 
    A_PR : process 
    begin 
      a  <= (others=>'0'); 
      wait for 5 ns; 
      a  <= (others=>'1'); 
      wait for 3 ns; 
      a  <= (others=>'0'); 
      wait;  -- wait forever 
    end process A_PR; 
  

    -------------------------=----------------------------------------- 
    -- B_process: process to drive the input signal B
    -------------------------=----------------------------------------- 
    B_PR : process 
    begin 
      b  <= (others=>'0') ;          
      wait for 4 ns; 
      b  <= (others=>'L');          --'L' indicates a weak logic '0'
      wait for 6 ns; 
      b  <= (others=>'1'); 
      wait;  -- wait forever 
    end process B_PR; 

    -------------------------=----------------------------------------- 
    -- SEL_process: process to drive the input select signal SEL
    -------------------------=----------------------------------------- 
    SEL_PR : process 
    begin 
      sel  <= '0'; 
      wait for 2 ns; 
      sel  <= '1'; 
      wait for 5 ns; 
      sel  <= '0'; 
      wait;  -- wait forever 
    end process SEL_PR; 

  end architecture; -- end of architecture 

