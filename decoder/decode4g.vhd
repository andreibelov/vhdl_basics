--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/2/24 3:00 AM
-- Design Name: decode4g.vhd
-- Module Name: decode4g
-- Project Name: vhdl_basics
-- Description: decoder with an active-LOW enable
-- Additional Comments:
-- 	Note that the d inputs are defined as type INTEGER,
--  rather than BIT_VECTOR or STD_LOGIC_VECTOR.
--  Thus, we don’t need to specify the number of inputs;
--  the compiler automatically defines the required inputs d1 and d0 when
--  fitting the design to the selected CPLD. Also, since d is of type INTEGER,
--  we write its value in th
e selected signal assignment statement directly,
--  without quotes.
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;

ENTITY decode4g IS PORT (
	d : IN INTEGER RANGE 0 to 3;
	g : IN STD_LOGIC;
	y : OUT STD_LOGIC_VECTOR (0 to 3));
END decode4g;

ARCHITECTURE a OF decode4g IS
BEGIN
	y <= "1000" WHEN (d=0 and g='0') ELSE
		 "0100" WHEN (d=1 and g='0') ELSE
		 "0010" WHEN (d=2 and g='0') ELSE
		 "0001" WHEN (d=3 and g='0') ELSE
		 "0000";
END ARCHITECTURE a;
