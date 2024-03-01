-- Entity
entity y_tri is port (
  OE        : in  std_logic;
  Dout      : in  std_logic_vector(3 downto 0);
  Pinout    : out std_logic_vector(3 downto 0) );
end entity y_tri;

-- Architecture
architecture tri_arch of y_tri is
begin
      Pinout <= Dout when (OE='1'),
                (others  => "ZZZZ") when others ;
end architecture tri_arch;