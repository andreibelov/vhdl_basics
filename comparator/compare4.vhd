--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: Dueck
--
-- Create Date: 4/2/24 2:03 AM
-- Design Name: compare4.vhd
-- Module Name: compare4
-- Project Name: vhdl_basics
-- Description: 4-bit comparator
-- Additional Comments:
-- 	Made with CLion
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY compare4 IS PORT (
	a, b : IN INTEGER RANGE 0 TO 15;
	agtb, aeqb, altb : OUT STD_LOGIC);
END compare4;

ARCHITECTURE a OF compare4 IS
	SIGNAL compare : STD_LOGIC_VECTOR (2 downto 0);
BEGIN
	-- Since VHDL allows inputs to be represented as integers,
	-- we can define the required size of inputs A and B and
	-- compare them using IF statements
	PROCESS (a, b)
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
		agtb <= compare(2);
		aeqb <= compare(1);
		altb <= compare(0);
	END PROCESS;
END ARCHITECTURE a;
