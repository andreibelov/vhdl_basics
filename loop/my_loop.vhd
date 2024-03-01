-- Entity
entity my_loop is port (
  A  : in std_logic_vector(7 downto 0);
  B  : in std_logic;
  Z  : out std_logic_vector(7 downto 0));
end entity my_loop;

-- Architecture
architecture Loop_Arch of my_loop is begin

    process (A)
        variable I :
          integer range 0 to 4;
    begin
        Z <= "0000";
        I := 0;
        while (I <= 3) loop
          if (A = I) then
            Z(I) <= '1';
          end if;
          I := I + 1;
        end loop;
    end process;

end architecture Loop_Arch;