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

architecture a of compare4 is
	signal compare : std_logic_vector (2 downto 0);
begin
	-- Since VHDL allows inputs to be represented as integers,
	-- we can define the required size of inputs A and B and
	-- compare them using IF statements
	-- 	-- Combinational Process Statement
	-- 	compare:
	-- 		process (A, B)
	-- 			-- Declaration(s)
	-- 		begin
	-- 			if (A < B) then
	-- 				comp <= "001";
	-- 			elsif (A = B) then
	-- 				comp <= "010";
	-- 			elsif (A > B) then
	-- 				comp <= "100";
	-- 			else
	-- 				comp <= "000";
	-- 			end if;
	-- 			AGTB <= comp(2);
	-- 			AEQB <= comp(1);
	-- 			ALTB <= comp(0);
	-- 		end process;

	-- Conditional Signal Assignmens
	compare <=
		"001" when (A < B) else
		"010" when (A = B) else
		"100" when (A > B) else
		"000";

	-- Concurrent Signal Assignments
	AGTB <= compare(2);
	AEQB <= compare(1);
	ALTB <= compare(0);
end architecture a;
