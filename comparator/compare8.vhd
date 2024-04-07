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

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_misc.all;

LIBRARY work;

entity compare8 is port (
	-- Input ports
	A, B :  IN  std_logic_vector(7 downto 0);
	-- Output ports
	AEB	 :  OUT  std_logic_vector(7 downto 0);
	AEQB, AGTB, ALTB :  OUT  STD_LOGIC);
end compare8;

architecture bdf_type of comp8 is

	component soft port(
		a_in : in std_logic;
		a_out : out std_logic);
	end component;

	SIGNAL	AXNORB :  std_logic_vector(7 downto 0);
	SIGNAL	AND_AXNORB :  std_logic_vector(7 downto 0);
	SIGNAL	SOFT_AXNORB :  std_logic_vector(7 downto 0);

begin
	-- Concurrent Signal Assignments
	AEB <= SOFT_AXNORB;

	AXNORB <= NOT(A XOR B);

	AEQB <= AND_REDUCE(SOFT_AXNORB(7 downto 0));
	ALTB <= OR_REDUCE((NOT(A) AND B) AND AND_AXNORB);
	AGTB <= OR_REDUCE((NOT(B) AND A) AND AND_AXNORB);

	AND_AXNORB(7) <= '1';
	AND_AXNORB(6) <= AND_AXNORB(7) AND SOFT_AXNORB(7);
	AND_AXNORB(5) <= AND_AXNORB(6) AND SOFT_AXNORB(6);
	AND_AXNORB(4) <= AND_AXNORB(5) AND SOFT_AXNORB(5);
	AND_AXNORB(3) <= AND_AXNORB(4) AND SOFT_AXNORB(4);
	AND_AXNORB(2) <= AND_AXNORB(3) AND SOFT_AXNORB(3);
	AND_AXNORB(1) <= AND_AXNORB(2) AND SOFT_AXNORB(2);
	AND_AXNORB(0) <= AND_AXNORB(1) AND SOFT_AXNORB(1);

	-- Generate Statements
	gen_soft:
		for I in 0 to 7 generate
			-- Component Instantiation Statements
			uX : soft
				port map (A_IN => AXNORB(I), A_OUT => SOFT_AXNORB(I));
		end generate;

end architecture bdf_type; -- of compare8
