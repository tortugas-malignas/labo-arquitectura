library ieee;
use ieee.std_logic_1164.all;

--  Un testbench no tiene puertos.
entity ff_nb_tb is
end ff_nb_tb;

architecture behav of ff_nb_tb is
    --  Declaración del componente que será instanciado.
    component ff_nb is
        generic(n: natural := 2);

        port( d:        in std_logic_vector(n-1 downto 0);
              reset:    in std_logic;
              clock:    in std_logic;
              q:        out std_logic_vector(n-1 downto 0)
          );
    end component;

    --  Especificamos que entidad está ligada con el componente.
    for ff1: ff_nb use entity work.ff_nb;
    signal d_s,q_s: std_logic_vector(30 downto 0);
    signal reset_s, clock_s: std_logic;

begin
  --  Instanciamos el componente.
    ff1:ff_nb  
        generic map (n => 31)
        port map (d => d_s,
                  clock => clock_s,
                  reset => reset_s,
                  q => q_s);
 --  Este process hace realmente el trabajo.
    process
    begin
        clock_s <= '1';
        wait for 5 ns;
        clock_s <= '0';
        wait for 5 ns;
    end process;

    process
    begin
        d_s <= "1111111111111111111111111111111";
        reset_s <= '1';
        wait for 10 ns;
        reset_s <= '0';
        wait for 5 ns;
        d_s <= "0000000000000000000000000000000";
        wait for 10 ns;
        d_s <= "1111111111111111111111111111111";
        wait for 40 ns;
    end process;
end behav;
