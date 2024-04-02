--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/2/24 3:07 AM
-- Design Name: mux4sel.vhd
-- Module Name: mux4sel
-- Project Name: vhdl_basics
-- Description: Quartus Prime VHDL Template
-- Additional Comments:
-- 	In the Altera Golden Rules,
--  we are told to choose a selected signal assignment over a conditional
--  signal assignment because it uses the CPLD resources more efficiently.
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY mux4sel IS PORT (
	d0, d1, d2, d3 : IN BIT;
	s : IN BIT_VECTOR (1 downto 0);
	y : OUT BIT);
END ENTITY mux4sel;

ARCHITECTURE mux4to1 OF mux4sel IS
BEGIN
	-- Selected Signal Assignment Statement
	-- The selected signal assignment (with <expr> select ...) is essentially
	-- a short-hand notion for creating a process along with the appropriate
	-- sensitivity list and case statement.
	M: WITH s SELECT
		y <= d0 WHEN "00",
			 d1 WHEN "01",
			 d2 WHEN "10",
			 d3 WHEN "11";
END ARCHITECTURE mux4to1;
