---------------------------------------------------------------------------------------------------
--
-- Title       : COMP_EXTENDED
-- Design      : project
-- Author      : Denisa
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : compExtended.vhd
-- Generated   : Sun Apr 12 19:34:40 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {COMP_EXTENDED} architecture {A}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity COMPARATOR is	
	generic (
		N: natural := 8
	);
	port (
		CONST: in STD_LOGIC_VECTOR(N-1 downto 0);
		CODE: in STD_LOGIC_VECTOR(N-1 downto 0);
		EQUAL: out STD_LOGIC
	);
end COMPARATOR;

--}} End of automatically maintained section

architecture A of COMPARATOR is
begin
	COMP: process(CONST, CODE)
	begin 
		if (CODE = CONST) then
			EQUAL <= '1';
		else 
			EQUAL <= '0';
		end if;
	end process COMP;
end A;
