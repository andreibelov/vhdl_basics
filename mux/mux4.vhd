-- mux4.vhd
-- encode the Boolean expression that describes a 4-to-1 MUX
-- Directs one of four input signals (d0 to d3) to output,
-- depending on status of select bits (s1, s0).

ENTITY mux4 IS PORT (
	d0, d1, d2, d3 : IN BIT;
	s : IN BIT_VECTOR (1 downto 0);
	y : OUT BIT);
END mux4;

ARCHITECTURE mux4to1 OF mux4 IS
BEGIN
	-- Concurrent Signal Assignment
	y <= ((not s(1)) and (not s(0)) and d0)
	  or ((not s(1)) and (    s(0)) and d1)
	  or ((    s(1)) and (not s(0)) and d2)
	  or ((    s(1)) and (    s(0)) and d3);
END mux4to1;
