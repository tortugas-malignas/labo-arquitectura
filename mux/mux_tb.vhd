library ieee;
use ieee.std_logic_1164.all;

entity mux_tb is
    -- empty
end mux_tb;

architecture tb of mux_tb is
    component mux
        port( d0: in std_logic_vector(31 downto 0);
              d1: in std_logic_vector(31 downto 0);
              s: in std_logic;
              y: out std_logic_vector(31 downto 0)
          );
    end component;

    signal d0_s, d1_s, y_s: std_logic_vector(31 downto 0);
    signal s_s: std_logic;
begin
    tb_mux: mux port map (d0 => d0_s, d1 => d1_s, s => s_s, y => y_s);

    -- The `wait` command cannot be used with a sensitivity list. i.e.
    -- process(d0_s, ...)
    -- begin
    process
    begin
        -- initialization
        d0_s <= (others => '0');
        d1_s <= (others => '0');
        s_s <= '0';
        wait for 4 ns;


        d0_s <= "00100000000000010010000100000000";
        wait for 4 ns;
        assert(y_s="00100000000000010010000100000000") report "[error 1] The output must be the d0 input";

        s_s <= '1';
        wait for 4 ns;
        assert(y_s="00000000000000000000000000000000") report "[error 2] The output 2 is the output 1! D:";

        assert(false)
        report "Done all";
    end process;
end tb;
