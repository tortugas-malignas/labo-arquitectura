library ieee;
use ieee.std_logic_1164.all;

--  Un testbench no tiene puertos.
entity adder_tb is
end adder_tb;
 
architecture behav of adder_32b_tb is
    --  Declaración del componente que será instanciado.
    component adder_32b is
        port (a, b : in std_logic_vector(31 downto 0);
          y: out std_logic_vector(31 downto 0));
    end component;

    --  Especificamos que entidad está ligada con el componente.
    for adder_0: adder_32b use entity work.adder;
    signal a_s, b_s, y_s : std_logic_vector(31 downto 0);

    begin
      --  Instanciamos el componente.
      adder_0: adder_32b port map (a => a_s, b => b_s, y => y_s);   
      --  Este process hace realmente el trabajo.
     process
         type pattern_type is record
           a, b, y : std_logic_vector(31 downto 0);
         end record;
 
       --  Los patrones a aplicar.
         type pattern_array is array (natural range <>) of pattern_type;
         constant patterns : pattern_array :=(("01010101010101010101010101010101", "01010101010101010101010101010101", "00000000000000000000000000000000"), ("10101010101010101010101010101010", "01010101010101010101010101010101", "11111111111111111111111111111111"))
         begin
             --  Chequeamos cada patrón.
             for i in patterns'range loop
                  --  Seteamos las entradas.
                    a_s <= patterns(i).a;
                    b_s <= patterns(i).b;
                    --  Esperamos por los resultados.
                    wait for 1 ns;
                    --  Chequeamos las salidas.
                    assert y_s = patterns(i).y
                        report "resultado de la suma erróneo" severity error;
              end loop;
              assert false report "fin del test" severity note;
              --  Esperamos por siempre; esto terminará la simulación.
              wait;
       end process;
  end behav;
