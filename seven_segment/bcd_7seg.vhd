--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/2/24 3:12 AM
-- Design Name: bcd_7seg.vhd
-- Module Name: bcd_7seg
-- Project Name: vhdl_basics
-- Description: Quartus Prime VHDL Template
-- Additional Comments:
-- 	Made with CLion
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY bcd_7seg IS PORT (
	d3, d2, d1, d0 : IN BIT;
	a, b, c, d, e, f, g : OUT BIT);
END bcd_7seg;

ARCHITECTURE seven_segment OF bcd_7seg IS
	SIGNAL input : BIT_VECTOR (3 downto 0);
	SIGNAL output: BIT_VECTOR (6 DOWNTO 0);
BEGIN
	input (3) <= d3;
	input (2) <= d2;
	input (1) <= d1;
	input (0) <= d0;

	WITH input SELECT
		output <= "0000001" WHEN "0000",
					"1001111" WHEN "0001",
					"0010010" WHEN "0010",
					"0000110" WHEN "0011",
					"1001100" WHEN "0100",
					"0100100" WHEN "0101",
					"1100000" WHEN "0110",
					"0001111" WHEN "0111",
					"0000000" WHEN "1000",
					"0001100" WHEN "1001",
					"1111111" WHEN others;
	-- Separate the output vector to make individual pin outputs.
	a <= output(6);
	b <= output(5);
	c <= output(4);
	d <= output(3);
	e <= output(2);
	f <= output(1);
	g <= output(0);
END seven_segment;
