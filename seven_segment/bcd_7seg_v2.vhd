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
	output : BIT_VECTOR(6 downto 0));
END bcd_7seg;

ARCHITECTURE seven_segment OF bcd_7seg IS
	SIGNAL d_inputs : INTEGER RANGE 0 to 9;
	SIGNAL input : BIT_VECTOR (3 downto 0);
BEGIN
	-- The inputs D 3 D 2 D 1 D 0 are defined separately,
	-- then concatenated (linked in sequence) by the & operator
	-- to make a BIT_VECTOR called input.
	-- This is equivalent to the following four concurrent signal assignments:
	-- 		input (3) <= d3;
	-- 		input (2) <= d2;
	-- 		input (1) <= d1;
	-- 		input (0) <= d0;
	input <= d3 & d2 & d1 & d0;
	d_inputs <= input;

	WITH d_inputs SELECT
		output <=	"0000001" WHEN 0,
					"1001111" WHEN 1,
					"0010010" WHEN 2,
					"0000110" WHEN 3,
					"1001100" WHEN 4,
					"0100100" WHEN 5,
					"1100000" WHEN 6,
					"0001111" WHEN 7,
					"0000000" WHEN 8,
					"0001100" WHEN 9,
					"1111111" WHEN others; --blank
END ARCHITECTURE seven_segment;
