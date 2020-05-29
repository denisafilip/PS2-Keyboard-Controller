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

entity orDoubleKeys is
	port (
		INPUT1, INPUT2: in STD_LOGIC;
		OUTPUT: out STD_LOGIC
	);
end orDoubleKeys;

--}} End of automatically maintained section

architecture Z of orDoubleKeys is
begin	
	process(INPUT1, INPUT2)	
	begin
		OUTPUT <= INPUT1 OR INPUT2;
	end process;
end Z;