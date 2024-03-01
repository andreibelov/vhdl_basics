-- https://surf-vhdl.com/vhdl-for-loop-statement/

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity accumulator is
port(
  i_clk             : in  std_logic;
  i_data0           : in  std_logic_vector(7 downto 0);
  i_data1           : in  std_logic_vector(7 downto 0);
  i_data2           : in  std_logic_vector(7 downto 0);
  i_data3           : in  std_logic_vector(7 downto 0);
  i_data4           : in  std_logic_vector(7 downto 0);
  i_data5           : in  std_logic_vector(7 downto 0);
  i_data6           : in  std_logic_vector(7 downto 0);
  i_data7           : in  std_logic_vector(7 downto 0);
  o_acc             : out std_logic_vector(10 downto 0));
end accumulator;

architecture rtl of accumulator is

type t_data  is array (0 to 7) of signed(10 downto 0);
signal r_data            : t_data;

begin

p_accumulator : process (i_clk)
variable vacc              : signed(10 downto 0);
begin
  if rising_edge(i_clk) then
    r_data(0)  <= to_signed(to_integer(signed(i_data0)),11);
    r_data(1)  <= to_signed(to_integer(signed(i_data1)),11);
    r_data(2)  <= to_signed(to_integer(signed(i_data2)),11);
    r_data(3)  <= to_signed(to_integer(signed(i_data3)),11);
    r_data(4)  <= to_signed(to_integer(signed(i_data4)),11);
    r_data(5)  <= to_signed(to_integer(signed(i_data5)),11);
    r_data(6)  <= to_signed(to_integer(signed(i_data6)),11);
    r_data(7)  <= to_signed(to_integer(signed(i_data7)),11);

    vacc := (others=>'0');
    l_acc : for k in 0 to r_data'length-1 loop
      vacc := vacc + r_data(k);
    end loop l_acc;

    o_acc <= std_logic_vector(vacc);
  end if;
end process p_accumulator;

end rtl;