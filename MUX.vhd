---------------------------------------------------------------------------------------------------
--
-- Title       : MUX
-- Design      : project
-- Author      : Denisa
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : MUX.vhd
-- Generated   : Mon Apr 13 12:07:08 2020
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

entity MUX is 
	generic (
		width: natural := 7
	);
	port (
		SIMPLE_KEY: in STD_LOGIC_VECTOR(width-1 downto 0);
		SPECIAL_KEY: in STD_LOGIC_VECTOR(width-1 downto 0);
		KEY_CODE: out STD_LOGIC_VECTOR(width-1 downto 0) := "1111110";
		EXTENDED: in STD_LOGIC --selection input
	);
end MUX;


architecture F of MUX is
begin
	MULTIPLEXOR: process(SPECIAL_KEY, SIMPLE_KEY, EXTENDED)
	begin
		if (EXTENDED = '0') then
			KEY_CODE <= SIMPLE_KEY;
		else KEY_CODE <= SPECIAL_KEY;
		end if;
	end process MULTIPLEXOR;
end F;
