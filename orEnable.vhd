---------------------------------------------------------------------------------------------------
--
-- Title       : andEnable
-- Design      : project
-- Author      : Denisa
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : andEnable.vhd
-- Generated   : Thu Apr 23 15:05:51 2020
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
--{entity {andEnable} architecture {J}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity orEnable is
	port (
		INPUT1, INPUT2: in STD_LOGIC;
		EXTENDED: in STD_LOGIC;
		Q: in STD_LOGIC_VECTOR(3 downto 0);
		OUTPUT: out STD_LOGIC
	);
end orEnable;

--}} End of automatically maintained section

architecture J of orEnable is
begin	
	process(INPUT1, INPUT2, EXTENDED, Q)	
	begin
		if (Q >= "0001") then
			OUTPUT <= '0';
		else
			OUTPUT <= (INPUT1 OR INPUT2) AND EXTENDED;	
		end if;
	end process;
end J;