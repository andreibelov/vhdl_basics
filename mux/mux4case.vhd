ENTITY mux4case IS PORT (
	d0, d1, d2, d3 : IN BIT;
	s : IN BIT_VECTOR (1 downto 0);
	y : OUT BIT);
END mux4case;

ARCHITECTURE mux4to1 OF mux4case IS
BEGIN
	-- CASE statement within a PROCESS
	-- Monitor select inputs and execute if they change
	PROCESS (s)
	BEGIN
		CASE s IS
			WHEN "00" => y <= d0;
			WHEN "01" => y <= d1;
			WHEN "10" => y <= d2;
			WHEN "11" => y <= d3;
			WHEN others => y <= '0';
		END CASE;
	END PROCESS;
END mux4to1;