library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity accumulator_better is
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
end accumulator_better;

architecture rtl of accumulator_better is
constant C_NUMDATA    : integer := 8;
type t_data  is array (0 to C_NUMDATA-1) of signed(10 downto 0);
signal r_data            : t_data;

begin

p_accumulator_better : process (i_clk)
type t_data_temp4  is array (0 to (C_NUMDATA/2)-1) of signed(10 downto 0); -- 4
type t_data_temp2  is array (0 to (C_NUMDATA/4)-1) of signed(10 downto 0); -- 2
variable vacc4              : t_data_temp4;
variable vacc2              : t_data_temp2;
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

    l_acc4 : for k in 0 to (C_NUMDATA/2)-1 loop
      vacc4(k) := r_data(2*k) + r_data(2*k+1);
    end loop l_acc4;

    l_acc2 : for k in 0 to (C_NUMDATA/4)-1 loop
      vacc2(k) := vacc4(2*k) + vacc4(2*k+1);
    end loop l_acc2;

    o_acc <= std_logic_vector(vacc2(0) + vacc2(1));
  end if;
end process p_accumulator_better;

end rtl;