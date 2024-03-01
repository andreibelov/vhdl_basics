library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

-- Testbench Entity : No port list
entity Counter_tb is  end entity Counter_tb;

-- Testbench Architecture
architecture Counter_arch of Counter_tb is

  component Counter port (
    d     : in std_logic_vector(3 downto 0);
    clk, reset, load, en : in std_logic;
    q     : out std_logic_vector(3 downto 0));
  end component Counter;

  constant delay : integer := 10; -- wait
  constant n     : integer := 4;  -- width counter
  constant T     : time    := 20 ns; -- clock period

  signal   clock : std_logic := '0';  -- clock generator
  signal   reset : std_logic := '0';  -- reset generator

  signal  data_tb : std_logic_vector(n-1 downto 0) := "0000";
  signal   load   : std_logic := '0';  -- stimulus
  signal   en     : std_logic := '0';  -- stimulus

  -- https://github.com/wzab/wzab-hdl-library/blob/master/genlfsr_hs/sim2/genlfsr_tb.vhd#L55
  -- https://stackoverflow.com/questions/42105535/stop-vhdl-simulation-with-wait-statements
  signal simend : boolean := false; -- signal to end simulation, used to stop clock process

  signal   q_tb   : std_logic_vector(3 downto 0); -- output
  signal   check  : std_logic_vector(n-1 downto 0) := "0000"; -- compare to count
begin
  -- DUT Instantiation
  DUT : Counter
    port map (
      d      => data_tb,
      clk    => clock,    reset  => reset,
      load   => load,     en     => en,
      q      => q_tb );

  clk_gen : process
  begin
      while simend=false loop
          clock <= not clock;
          wait for T/2;
      end loop;
      wait;
  end process clk_gen;

--   clk <= not clk after T/2 when not simend else clk

  reset <= '1', '0' after 10 ns; --  10 nsec

  test_proc : process
    variable line_o : line;
  begin
    wait until falling_edge(reset); --  wait for reset
    wait until falling_edge(clock); --  wait for a clock
    load <= '1';    en <= '0';
    data_tb <= "1010";
    wait until falling_edge(clock);
    if (q_tb /= "1010") then
      write(line_o, string'("Load fail "));
      write(line_o, q_tb);
      writeline(output, line_o);
    end if;
    check <= "1010";
    load  <= '0';
    en    <= '1';
    wait for 1 ns;
    for i in 1 to 2**n loop
      check <= check + 1;
      wait until falling_edge(clock);
      if (q_tb /= check ) then
        report "count fail at time count" &
          time'image(now) & integer'image(i);
      end if;
    end loop;

    -- Pause this process forever after all tests are done
    simend <= true;
    wait;
    report "Just Kidding.   Test Done." & time'image(now) severity failure ;
  end process test_proc;
end architecture Counter_arch;
