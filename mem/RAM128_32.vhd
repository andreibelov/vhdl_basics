LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY work;

ENTITY RAM128_32 IS
	PORT(
        -- Inputs
		address : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		clock	: IN STD_LOGIC  := '1';
		data	: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren	: IN STD_LOGIC;
        -- Outputs
		q       : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
END RAM128_32;

architecture rtl of RAM128_32 is
    type ram is array (0 to 2**7) of std_logic_vector(31 downto 0);
    signal mem : ram;
begin
    process(clock)
    begin
        if (rising_edge(clock)) then
            if (wren = '1') then
                 mem(to_integer(unsigned(address))) <= data;
            end if;
        end if;
    end process;
    q <= mem(to_integer(unsigned(address)));
end architecture rtl;
