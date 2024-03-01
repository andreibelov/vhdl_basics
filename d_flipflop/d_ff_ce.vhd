-- Entity
entity DFF is port (
  d, clk, set, reset     : in  std_logic;
  q                      : out std_logic    );
end entity DFF;

-- Architecture
architecture DFF_Arch of DFF is begin
    dff_proc_2 : process (clk, set, reset)
    begin
        if (reset='1') then
          q <= '0'; -- Async
        elsif (rising_edge(clk)) then
            if (set='0') then
                q <= '1'; -- Sync
            else
                q <=   d; -- Sync
            end if;
        end if;
    end process dff_proc_2;
end architecture DFF_Arch;
