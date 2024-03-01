library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Entity
entity Add4 is port (
   Data1,Data2 : in std_logic_vector(3 downto 0);
   Cin         : in std_logic;
   Cout        : out std_logic;
   Sum         : out std_logic_vector(3 downto 0));
end entity Add4;

-- Architecture
Architecture RTL of Add4 is
  signal Out5bit : std_logic_vector(4 downto 0);
begin
  Out5bit <= ('0' & Data1) + ('0' & Data2) + Cin;
  Sum      <= Out5bit(3 downto 0);        -- 4 bits
  Cout      <= Out5bit(4);                -- 5th bit

--   process(Data1, Data2, Cin)
--     variable carry : STD_LOGIC := '0';
--   begin
--     carry := Cin; -- assign value to the variable inside the process
--     for i in 0 to 3 loop
--       Sum(i) <= Data1(i) xor Data2(i) xor carry;
--       carry  := (Data1(i) and Data2(i)) or (Data2(i) and carry) or (carry and Data1(i));
--     end loop;
--     Cout <= carry;
--   end process;
end Architecture RTL;