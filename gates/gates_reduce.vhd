-- Entity :  Note:  use IEEE.std_logic_misc.all;
entity gates_reduce is port (
  vA, vB, vC, vD  : in  std_logic_vector(3 downto 0);
  W,U,X,Y,Z       : out std_logic  );
end entity gates_reduce;

-- Architecture : reduction after VHDL-2008 tools
architecture RTL of gates_reduce is
begin
  W  <=  AND_REDUCE(vA);  -- Vector Reduction AND
  U  <=  NOR_REDUCE(vB);  -- Vector Reduction NOR
  X  <=  XOR_REDUCE(vD);  -- Vector Reduction XOR
  Y  <=  OR_REDUCE(vA) and vB(0);  -- OR Red, bit AND
  Z  <=  OR_REDUCE(vA and vB);     -- Bit AND, OR Red
end architecture RTL;