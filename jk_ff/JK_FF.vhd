-- https://allaboutfpga.com/vhdl-code-flipflop-d-t-jk-sr/

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity JK_FF is
PORT(K,CLOCK,J: in std_logic;
     Q, QB: out std_logic);
end JK_FF;

Architecture behavioral of JK_FF is
BEGIN
	PROCESS(CLOCK)
		VARIABLE TMP: std_logic;
	BEGIN
		if (CLOCK='1' and CLOCK'EVENT) then
			if (J='0' and K='0') then
				TMP:=TMP;
			elsif (J='1' and K='1') then
				TMP:= not TMP;
			elsif (J='0' and K='1') then
				TMP:='0';
			else
				TMP:='1';
			end if;
		end if;
		Q <= TMP;
		QB <= not TMP;
	end PROCESS;
end behavioral;
