library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FIFO8x9 is
   port(
      clk, rst:		in std_logic;
      RdPtrClr, WrPtrClr:	in std_logic;    
      RdInc, WrInc:	in std_logic;
      DataIn:	 in std_logic_vector(8 downto 0);
      DataOut: out std_logic_vector(8 downto 0);
      rden, wren: in std_logic
	);
end entity FIFO8x9;

architecture RTL of FIFO8x9 is
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
	-- makes use of VHDL’s enumerated type
	type fifo_array is array(7 downto 0) of std_logic_vector(8 downto 0);
	signal fifo:  fifo_array;
	signal wrptr, rdptr: unsigned(2 downto 0);
	signal en: std_logic_vector(7 downto 0);
	signal dmuxout: std_logic_vector(8 downto 0);
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
    -- fifo8x9_2
    COMPONENT fifo8x9_2
        port(
            -- Inputs
            clk, rst:                 in std_logic;
            rd, wr, rdinc, wrinc:     in std_logic;
            rdptrclr, wrptrclr:       in std_logic;
            data_in:                  in std_logic_vector(8 downto 0);
            -- Outputs
            data_out:                 out std_logic_vector(8 downto 0));
    end COMPONENT;
begin

    b2v_inst : fifo8x9_2
    PORT MAP(clk => clk,
             rst => rst,
             rd => rden,
             wr => wren,
             rdinc => RdInc,
             wrinc => WrInc,
             rdptrclr => RdPtrClr,
             wrptrclr => WrPtrClr,
             data_in => DataIn,
             data_out => DataOut);

end architecture RTL;
