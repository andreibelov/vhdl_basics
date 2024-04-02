--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/2/24 2:51 AM
-- Design Name: decode3.vhd
-- Module Name: decode3
-- Project Name: vhdl_basics
-- Description: Quartus Prime VHDL Template
-- Additional Comments:
-- 	Made with CLion
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;

ENTITY decode3 IS PORT (
	d : IN STD_LOGIC_VECTOR (1 downto 0);
	y : OUT STD_LOGIC_VECTOR (3 downto 0));
END decode3;

ARCHITECTURE decoder OF decode3 IS
BEGIN
	-- Since a STD_LOGIC_VECTOR can have values other than '0' and '1'
	-- the values listed for d don't cover all possible cases.
	-- The default case ("WHEN others") is required because of the multivalued
	-- logic type STD_LOGIC_VECTOR.
	-- The default case would not be required if we chose to use BIT_VECTOR,
    -- rather than STD_LOGIC_VECTOR, since the listed combinations of d cover
    -- all possible combinations of a BIT_VECTOR.
	WITH d SELECT
		y <= "0001" WHEN "00",
			 "0010" WHEN "01",
			 "0100" WHEN "10",
			 "1000" WHEN "11",
			 "0000" WHEN others;
END ARCHITECTURE decoder;
