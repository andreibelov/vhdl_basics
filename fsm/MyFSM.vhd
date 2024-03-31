--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: Andrei Belov
--
-- Create Date: 02/02/2024 01:04:13 AM
-- Design Name: MyFSM.vhd
-- Module Name: MyFSM
-- Project Name: vhdl_basics
-- Description:
-- Additional Comments:
--
--------------------------------------------------------------------------------

-- Use standard IEEE library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity port declaration
entity MyFSM is port (
	Run : in std_logic;
	Clk, Reset : in std_logic;
	Result : in std_logic);
end entity MyFSM;

-- Architecture of MyFSM
architecture struct of MyFSM is
	type stateType is (s0, s1);
	signal CurrentState, NextState : stateType;
begin
	-- Synchronous process (State FFs)
	SyncProcess: process(Reset, Clk)
	begin
		if (Reset = '1') then
			CurrentState <= s0;
		elsif (rising_edge(Clk)) then
			CurrentState <= NextState;
		end if;
	end process SyncProcess;

	-- Combinatorial process (State and output decode)
	CombProcess : process (CurrentState, Run)
	begin
		case CurrentState is
			when s0 =>
				Result <= '0';
				if (Run = '1') then
					NextState <= s1;
				else
					NextState <= s0;
				end if;
			when s1 =>
				Result <= '1';
				if (Run = '1') then
					NextState <= s0;
				else
					NextState <= s1;
				end if;
			when others =>
				Result <= '0';
				NextState <= s0;
		end case;
	end process CombProcess;
end architecture struct;
