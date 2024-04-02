--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/2/24 2:16 AM
-- Design Name: compare8.vhd
-- Module Name: compare8
-- Project Name: vhdl_basics
-- Description: Quartus Prime VHDL Template
-- Additional Comments:
--  VHDL allows inputs to be represented as integers, we can define the required
--  size of inputs A and B and compare them using IF statements.
-- 	The beauty of this method is that the number of input bits can be changed
--  by modifying one number: the range of the INTEGER-type input.
--  For example, a 12-bit comparator is identical to the 8-bit comparator
--  in this VHDL code, except that the inputs have a range of 0 to 4095.
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY compare8 IS PORT(
	a, b			 : IN INTEGER RANGE 0 TO 255;
	agtb, aeqb, altb : OUT STD_LOGIC);
END compare8;

ARCHITECTURE arch OF compare8 IS
	SIGNAL compare : STD_LOGIC_VECTOR (2 downto 0);
BEGIN
	comp8: PROCESS (a,b)
	BEGIN
		IF (a < b) THEN
			compare <= "110";
		ELSIF (a = b) THEN
			compare <= "101";
		ELSIF (a > b) THEN
			compare <= "011";
		ELSE
			compare <= "111";
		END IF;
		agtb  <= compare(2);
		aeqb  <= compare(1);
		altb  <= compare(0);
	END PROCESS comp8;
END ARCHITECTURE arch;
