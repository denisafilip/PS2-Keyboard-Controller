---------------------------------------------------------------------------------------------------
--
-- Title       : EDCD
-- Design      : project
-- Author      : Denisa
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : extendedDecoder.vhd
-- Generated   : Thu Apr 16 14:38:11 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity EDCD is
	port ( 
		ALFA: in STD_LOGIC_VECTOR(7 downto 0);
		SPECIAL_KEY: out STD_LOGIC_VECTOR(6 downto 0) := "1111110"
	);
end EDCD;

architecture G of EDCD is
begin
	EXTENDED: process(ALFA)
	begin
		case ALFA is
			when "01110000" => SPECIAL_KEY <= "1001111";  --insert - E0 70
			when "01001010" => SPECIAL_KEY <= "1011010";  --/ numpad - E0 4A  
			when "01110001" => SPECIAL_KEY <= "1111111"; -- delete - E0 71	 
			when "01111101" => SPECIAL_KEY <= "0111111"; -- page up	
			when "01111010" => SPECIAL_KEY <= "1110111"; -- page down
			when "01101001" => SPECIAL_KEY <= "0110000"; -- end	 
			when "01101100" => SPECIAL_KEY <= "1100010"; -- home
			when others => SPECIAL_KEY <= "1111111";
		end case;
	end process EXTENDED;	
end G;
