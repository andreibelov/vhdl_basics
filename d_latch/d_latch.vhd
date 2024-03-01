-- Entity
entity DLatches is port (
  d, gate, clr        : in  std_logic;
  q                   : out std_logic    );
end entity DLatches;

-- Architecture
architecture LArch of DLatches is begin
  -- one Latch example
  latch_proc_1 : process (gate, d)
  begin
      if    (gate='1') then  q <= d;
               -- No rising_edge()
      end if;
         -- No gate=0 value, so latch inferred
  end process latch_proc_1;

  -- another Latch example
  latch_proc_2 : process (gate, d, clr)
  begin
      if    (clr ='1') then  q <= '0';
      elsif (gate='1') then  q <= d;
      end if;
  end process latch_proc_2;
end architecture LArch;
