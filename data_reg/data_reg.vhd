--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: Andrei Belov
--
-- Create Date: 02/02/2024 01:04:13 AM
-- Design Name: data_reg.vhd
-- Module Name: Data_Reg
-- Project Name: vhdl_basics
-- Description: simple Data_Reg implementation
-- Additional Comments:
--
--------------------------------------------------------------------------------

-- Entity
entity Data_Reg is port (
  clk, reset, load : in  std_logic;
  d : in  std_logic_vector(3 downto 0);
  q : out std_logic_vector(3 downto 0));
end entity Data_Reg;

-- Architecture
architecture Reg_Arch of Data_Reg is begin
  dreg_proc : process (clk, reset, load)
    begin
      if    (reset='0')        then  q <= "0000";
      elsif (rising_edge(clk)) then
        if (load='1')          then  q <= d;
        end if;
      end if;
  end process dreg_proc;
end architecture Reg_Arch;
