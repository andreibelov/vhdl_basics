LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity
entity Counter is port (
  clk, reset, load, en : in  std_logic;
  d         : in  std_logic_vector(3 downto 0);
  q         : out std_logic_vector(3 downto 0));
end entity Counter;

-- Architecture
architecture Counter_Arch of Counter is
    SIGNAL  qreg : std_logic_vector(3 downto 0);
begin
    count_proc : process (clk, reset, load, en)
    begin
        if    (reset='1') then
            qreg  <= "0000";
        elsif (rising_edge(clk)) then
            if (load='1') then
                qreg <= d;
            elsif (en='1') then
--                 q <= q + 1; --2008
                qreg <= std_logic_vector(unsigned(qreg) + 1);
            end if;
        end if;
    end process count_proc;
    q <= qreg;
end architecture Counter_Arch;