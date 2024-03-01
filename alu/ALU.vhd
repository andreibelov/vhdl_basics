LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ALU IS
    PORT(
    -- Inputs
        Op_code : IN STD_LOGIC_VECTOR( 2 DOWNTO 0 );
        A, B : IN STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    -- outputs
        Y : OUT STD_LOGIC_VECTOR( 31 DOWNTO 0 ));
END ALU;

ARCHITECTURE arch OF ALU IS
    SIGNAL  inc_A	:	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    SIGNAL  dec_A	:	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
BEGIN
	comb_ALU	: PROCESS(Op_code, A, B)
	begin
		inc_A <= STD_LOGIC_VECTOR(unsigned(A) + 1);
		dec_A <= STD_LOGIC_VECTOR(unsigned(A) - 1);
		Op_code_switch : case(Op_code) is
		    --  Opcode : Operation :    Function
			when "000" => Y <= A;       -- A
			when "001" => Y <= A + B;   -- Add
			when "010" => Y <= A - B;   -- Subtract
			when "011" => Y <= A AND B; -- AND
			when "100" => Y <= A OR B;  -- OR
			when "101" => Y <= inc_A;   -- Increment A
			when "110" => Y <= dec_A;   -- Decrement A
			when "111" => Y <= B;       -- B
			-- https://groups.google.com/g/comp.lang.vhdl/c/9o_O0VgVFNc
			when others => Y <= (others => '0');
		end case Op_code_switch;
	END PROCESS comb_ALU;
end architecture arch;

-- ARCHITECTURE ALU_ARCH OF ALU IS
-- begin
-- 	with Op_code select
-- 		Y <= A when "000",
-- 		     A + B when "001",
-- 		     A - B when "010",
-- 		     A and B when "011",
-- 		     A or B when "100",
-- 		     STD_LOGIC_VECTOR(unsigned(A) + 1) when "101",
-- 		     STD_LOGIC_VECTOR(unsigned(A) - 1) when "110",
-- 		     B when "111",
-- 		     (others => '0') when others;
-- END ARCHITECTURE ALU_ARCH;