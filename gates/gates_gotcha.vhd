-- Entity
entity gates is port (
  A,B,C,D     : in  std_logic;
  Y           : out std_logic    );
end entity gates;

-- Architecture
architecture combo of gates is begin
  combo_process : process (A,B,C,D)
  begin
    if    ((C=‘1’) and (D=‘1’)) then  Y <= ‘0’;
    elsif ((A=‘1’) or  (B=‘1’)) then  Y <= ‘1’;
    end if;  -- Missing Else condition for Y
  end process combo_process;
end architecture combo;