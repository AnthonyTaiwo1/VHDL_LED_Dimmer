library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwm is
	port (
	slowclk: in std_logic;
	z: in integer range 0 to 256;
	output: out std_logic);	
end pwm;


architecture pw_mod of pwm is
begin
pw:	process (slowclk,z)

			variable count2 : integer range 0 to 256;	
	begin

		if rising_edge (slowclk) then	
			count2 := count2 + 1;
			if count2<z then
				output <= '1';
			elsif count2>z then	
				output <= '0';
			else count2 := 0;                                                                                                                                                                                                     
			end if;		
		end if;
end process pw;
end pw_mod;
 