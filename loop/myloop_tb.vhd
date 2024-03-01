entity WhileLoopTb is
end entity;

-- Architecture
architecture Loop_Arch_TB of T05_WhileLoopTb is begin

    -- To prevent sim hang-up an inf loop should contain at least one
    -- wait or exit statement:
    process (A)
      variable I :
        integer range 0 to 4;
    begin
      Z <= "0000";
      I := 0;
      L1: loop
        exit L1 when I = 4;
        if (A = I) then
           Z(I) <= '1';
        end if;
        I := I + 1;
      end loop;
    end process;

end architecture Loop_Arch_TB;
