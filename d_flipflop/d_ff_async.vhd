-- Entity
entity DFF is port (
  d, clk, ce, reset      : in  std_logic;
  q                      : out std_logic    );
end entity DFF;

-- Architecture
architecture DFF_Arch of DFF is begin
    dff_proc_3 : process (clk, ce, reset)
    begin
        if (reset='1') then
            q <= '0'; -- Async
        elsif (rising_edge(clk)) then
           if (ce='1') then
             q <= d; -- Sync
           end if;
        end if;
    end process dff_proc_3;
end architecture DFF_Arch;