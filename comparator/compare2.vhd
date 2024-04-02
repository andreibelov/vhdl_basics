--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: Andrei Belov
--
-- Create Date: 02/02/2024 01:04:13 AM
-- Design Name: compare2.vhd
-- Module Name: MyFSM
-- Project Name: vhdl_basics
-- Description: 2-bit magnitude comparator
-- Additional Comments:
--  VHDL representation of a magnitude comparator using a concurrent signal
--  assignment statement for each comparing function
--------------------------------------------------------------------------------

ENTITY compare2 IS PORT(
	a, b : IN BIT_VECTOR (1 downto 0);
	agtb, aeqb, altb : OUT BIT);
END compare2;

ARCHITECTURE Behavioral OF compare2 IS
BEGIN
	altb <= (not (a(1)) and b(1)) or ((not (a(1) xor b(1))) and (not (a(0)) and b(0)));
	aeqb <= (not (a(1) xor b(1))) and (not (a(0) xor b(0)));
	agtb <= (a(1) and not (b(1))) or ((not (a(1) xor b(1))) and (a(0) and not (b(0))));
END ARCHITECTURE Behavioral;
