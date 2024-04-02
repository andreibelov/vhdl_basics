--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/2/24 2:38 AM
-- Design Name: debounce.vhd
-- Module Name: debounce
-- Project Name: vhdl_basics
-- Description: Quartus Prime VHDL Template
-- Additional Comments:
-- 	Made with CLion
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY debounce IS PORT(
	clk : IN STD_LOGIC;
	pb_in : IN STD_LOGIC;
	pb_out : OUT STD_LOGIC);
END debounce;

ARCHITECTURE debouncer OF debounce IS
	-- Internal signals required to interconnect counter and shift register
	SIGNAL srg_ser_out, srg_ser_in, srg_clk, srg_load : STD_LOGIC;
	SIGNAL srg_data : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL ctr_q : STD_LOGIC_VECTOR (15 DOWNTO 0);
BEGIN
	
	-- Instantiate 16-bit counter
	clock_divider: lpm_counter
		GENERIC MAP (LPM_WIDTH  => 16)
		PORT MAP (clock	=> clk,
					q	=> ctr_q(15 DOWNTO 0));

	-- Instantiate 4-bit shift register
	four_bit_delay: lpm_shiftreg
		GENERIC MAP (LPM_WIDTH  => 4)
		PORT MAP (shiftin	=> srg_ser_in,
					clock	=> srg_clk,
					load	=> srg_load,
					data	=> srg_data(3 downto 0),
					shiftout  => srg_ser_out);

	-- Shift register is clocked by counter output
	-- (divides system clock by 2ˆ16)
	srg_clk  <= ctr_q(15);

	-- Undebounced pushbutton input to shift register
	srg_ser_in <= not pb_in;

	-- Shift register is parallel-loaded with output data if
	-- shift register input and output are the same.
	-- If input and output are different, data are serial-shifted.
	srg_data(3)  <= srg_ser_out;
	srg_data(2)  <= srg_ser_out;
	srg_data(1)  <= srg_ser_out;
	srg_data(0)  <= srg_ser_out;
	pb_out  <= srg_ser_out;
	srg_load  <= not((not pb_in) xor srg_ser_out);
END ARCHITECTURE debouncer;