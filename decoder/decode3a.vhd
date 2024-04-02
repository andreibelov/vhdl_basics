--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/2/24 2:55 AM
-- Design Name: decode3a.vhd
-- Module Name: decode3a
-- Project Name: vhdl_basics
-- Description: Quartus Prime VHDL Template
-- Additional Comments:
-- we can increase the input vector size to include the g input
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;

ENTITY decode3a IS PORT (
	d : IN STD_LOGIC_VECTOR (1 downto 0);
	g : IN STD_LOGIC;
	y : OUT STD_LOGIC_VECTOR (3 downto 0));
END decode3a;

ARCHITECTURE decoder OF decode3a IS
	SIGNAL inputs : STD_LOGIC_VECTOR (2 downto 0);
BEGIN
	-- we can increase the input vector size to include the g input
	inputs(2) <= g;
	inputs(1 downto 0) <= d;
	WITH inputs SELECT
		y <= "0001" WHEN "000",
			 "0010" WHEN "001",
			 "0100" WHEN "010",
			 "1000" WHEN "011",
			 "0000" WHEN others;
END decoder;
