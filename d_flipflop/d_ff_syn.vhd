-- Entity
entity d_ff_syn is port (
  d, clk, reset          : in  std_logic;
  q                      : out std_logic    );
end entity d_ff_syn;

-- Architecture,
-- could use (clk'event and clk='1')
architecture DFF_Arch of d_ff_syn is begin
  dff_proc_1 : process (clk)
    begin
       if (rising_edge(clk))  then
         if (reset='1') then
            q <=  '0'; --  Sync Reset
         else
            q <= d;
         end if;
       end if;
  end process dff_proc_1;
end architecture DFF_Arch;