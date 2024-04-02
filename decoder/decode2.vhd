--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/2/24 2:46 AM
-- Design Name: decode2.vhd
-- Module Name: decode2
-- Project Name: vhdl_basics
-- Description: Quartus Prime VHDL Template
-- Additional Comments:
-- 	Made with CLion
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY decode2 IS PORT (
	d1, d0, g : IN BIT;
	y0, y1, y2, y3 : OUT BIT);
END ENTITY decode2;

ARCHITECTURE decoder2 OF decode2 IS
BEGIN
	y0 <= (not d1) and (not d0) and (not g);
	y1 <= (not d1) and (    d0) and (not g);
	y2 <= (    d1) and (not d0) and (not g);
	y3 <= (    d1) and (    d0) and (not g);
END ARCHITECTURE decoder2;
