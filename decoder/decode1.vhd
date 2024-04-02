--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/2/24 2:45 AM
-- Design Name: decode1.vhd
-- Module Name: decode1
-- Project Name: vhdl_basics
-- Description: Quartus Prime VHDL Template
-- Additional Comments:
-- 	Made with CLion
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;

ENTITY decode1 IS PORT (
	d1, d0 : IN BIT;
	y0, y1, y2, y3 : OUT BIT);
END decode1;

ARCHITECTURE decoder1 OF decode1 IS
BEGIN
	y0 <= (not d1) and (not d0);
	y1 <= (not d1) and (    d0);
	y2 <= (    d1) and (not d0);
	y3 <= (    d1) and (    d0);
END decoder1;

