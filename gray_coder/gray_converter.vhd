--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/2/24 2:13 AM
-- Design Name: gray_converter.vhd
-- Module Name: gray_converter
-- Project Name: vhdl_basics
-- Description: Quartus Prime VHDL Template
-- Additional Comments:
-- 	 Digital Design: An Embedded Systems Approach Using VHDL Peter J. Ashenden
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gray_converter is port (
	gray_value : in std_logic_vector(3 downto 0);
	numeric_value : out unsigned(3 downto 0));
end entity gray_converter;

architecture table of gray_converter is
begin
	with gray_value select
		numeric_value	<= 	"0000" when "0000", "0001" when "0001",
							"0010" when "0011", "0011" when "0010",
							"0100" when "0110", "0101" when "0111",
							"0110" when "0101", "0111" when "0100",
							"1000" when "1100", "1001" when "1101",
							"1010" when "1111", "1011" when "1110",
							"1100" when "1010", "1101" when "1011",
							"1101" when "1001", "1111" when others;
end architecture table;
