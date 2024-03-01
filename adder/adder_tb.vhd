library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use ieee.std_logic_textio.all;

library std;
use std.textio.all;

-- Entity : no port list !
entity tb_adder is
end entity tb_adder;

-- Architecture
architecture test_arch of tb_adder is
  component Add4 port (
    Data1,Data2 : in std_logic_vector(3 downto 0);
    Cin         : in std_logic;
    Cout        : out std_logic;
    Sum         : out std_logic_vector(3 downto 0));
  end component Add4;

  signal a_tb, b_tb : std_logic_vector(3 downto 0); -- INPUT
  signal Cin        : std_logic;                    -- INPUT
  signal Sum_tb     : std_logic_vector(3 downto 0); -- OUTPUT
  signal Cout_tb    : std_logic;                    -- OUTPUT
  signal expect     : std_logic_vector(3 downto 0); --expected

begin
  -- DUT Instantiation
  DUT : Add4 port map (
        Data1 => a_tb,   Data2 => b_tb,
        Cin   => Cin,    Cout  => Cout_tb, Sum => Sum_tb);

--   -- Stimulus by hand drawn waves, poor coverage
--   stim_proc : process begin
--    wait for 0 ns;
--      a_tb   <= "0010"; b_tb <= "0010"; Cin <= '0'; expect <= "0100";
--    wait for 10 ns;
--      a_tb   <= "1111"; b_tb <= "0000"; Cin <= '1'; expect <= "0000";
--    wait for 10 ns;
--      a_tb   <= "0010"; b_tb <= "0100"; Cin <= '1'; expect <= "0111";
--    wait;
--   end process stim_proc;

  -- Monitor
  txt_out : process (Sum_tb, Cout_tb)
    variable str_o : line;
  begin
    write(str_o, LF);
    write(str_o, string'(" a="));      write(str_o, a_tb);
    write(str_o, string'(" b="));      write(str_o, b_tb);
    write(str_o, string'(" cin="));    write(str_o, Cin);
    write(str_o, string'(" sum="));    write(str_o, Sum_tb);
    write(str_o, string'(" cout="));   write(str_o, Cout_tb);
    write(str_o, string'(" expect=")); write(str_o, expect);
    write(str_o, LF);
    report time'image(now) & str_o.all severity note;
  end process txt_out;

--   expect_proc : process (sum_tb)
--   begin
--     expect <= a_tb + b_tb + Cin;
--   end process expect_proc;

  -- Architecture : Generates coverage and expected stimulus
  Loop_proc: process
      variable i, j, k : integer := 0;
      constant n : integer := 4;
      variable str_o : line;
      variable a_v, b_v : std_logic_vector(3 downto 0) := "0000";
      variable Cin_v : std_logic := '0' ;
    begin
      wait for 0 ns;
      a_tb   <= "0010"; b_tb <= "0010"; Cin <= '0'; expect <= "0100";
      wait for 10 ns;
      a_tb   <= "1111"; b_tb <= "0000"; Cin <= '1'; expect <= "0000";
      wait for 10 ns;
      a_tb   <= "0010"; b_tb <= "0100"; Cin <= '1'; expect <= "0111";
      wait for 10 ns;
      -- https://nandland.com/common-vhdl-conversions/#Numeric-Integer-To-Std_Logic_Vector

      for i in 0 to 2**n-1 loop
        for j in 0 to 2**n-1 loop
          for k in 0 to 1 loop
            a_v := std_logic_vector(to_unsigned(i, a_tb'length));
            b_v := std_logic_vector(to_unsigned(j, b_tb'length));
            Cin_v :=  to_unsigned(k, 1)(0);
            a_tb <= a_v;
            b_tb <= b_v;
            Cin  <= Cin_v;
            expect <= a_v + b_v + Cin_v;
            wait for 10 ns;
            if (sum_tb /= a_tb + b_tb + Cin) then
                write(str_o, string'("Error - Sum"));
                writeline(output, str_o);
                wait;
            end if;
          end loop;
        end loop;
      end loop;

    assert false report "Test Complete" & time'image(now) severity failure;
    end process Loop_proc;

end architecture test_arch;
