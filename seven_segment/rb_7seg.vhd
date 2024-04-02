--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/2/24 11:14 PM
-- Design Name: rb_7seg.vhd
-- Module Name: rb_7seg
-- Project Name: vhdl_basics
-- Description: Seven segment ripple blanking circuit
-- Additional Comments:
--  The ripple blanking feature allows for suppression of leading or trailing
--  zeros in a multiple digit display, while allowing zeros to be displayed
--  in the middle of a number.
--  Each display decoder has a ripple blanking input and
--  a ripple blanking output, which are connected in cascade
--
-- 	~RBI - Ripple blanking input
-- 	~RBO - Ripple blanking output
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY rb_7seg IS PORT (
	nRBI, d3, d2, d1, d0 : IN BIT;
	a, b, c, d, e, f, g, nRBO : OUT BIT);
END ENTITY rb_7seg;

ARCHITECTURE seven_segment OF rb_7seg IS
	SIGNAL input: BIT_VECTOR (3 DOWNTO 0);
	SIGNAL output: BIT_VECTOR (6 DOWNTO 0);
BEGIN
	input <= d3 & d2 & d1 & d0;
	-- Process Statement
	PROCESS (input, nRBI)
	BEGIN
		IF (input = "0000" and nRBI ='0') THEN
			-- 0 suppressed
			output <= "1111111";
			nRBO <= '0';
		ELSIF (input = "0000" and nRBI = '1') THEN
			-- 0 displayed
			output <= "0000001";
			nRBO <= '1';
		ELSE
			CASE input IS
				WHEN "0001" => output <= "1001111"; -- 1
				WHEN "0010" => output <= "0010010"; -- 2
				WHEN "0011" => output <= "0000110"; -- 3
				WHEN "0100" => output <= "1001100"; -- 4
				WHEN "0101" => output <= "0100100"; -- 5
				WHEN "0110" => output <= "0100000"; -- 6
				WHEN "0111" => output <= "0001111"; -- 7
				WHEN "1000" => output <= "0000000"; -- 8
				WHEN "1001" => output <= "0000100"; -- 9
				WHEN others => output <= "1111111"; -- blank
			END CASE;
			nRBO  <= '1';
		END IF;  
		-- Separate the output vector to make individual pin outputs.
		a <= output(6);
		b <= output(5);
		c <= output(4);
		d <= output(3);
		e <= output(2);
		f <= output(1);
		g <= output(0);
	END PROCESS;
END ARCHITECTURE seven_segment;
