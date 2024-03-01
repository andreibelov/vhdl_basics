-- Entity
entity my_loop is port (
  xin   : in    std_logic_vector(7 downto 0);
  xout  : out   std_logic_vector(7 downto 0));
end entity my_loop;

-- Architecture
architecture XorGen_Arch of XorGen is begin

  Gen_proc : for i in 0 to 7 generate
      xout(i) <= xin1(i) xor  xin(2);
  end generate Gen_proc;

end architecture XorGen_Arch;
