---------------------------------------------------------------------------------------------------
--
-- Title       : orEnable
-- Design      : project
-- Author      : Denisa
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : orEnable.vhd
-- Generated   : Fri Apr 24 19:32:05 2020
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
--{entity {orEnable} architecture {S}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity andEnable is
	port (
		EXTENDED_ALFA, BREAK_ALFA: in STD_LOGIC;
		ENABLE_DCD: out STD_LOGIC
	);
end andEnable;

--}} End of automatically maintained section

architecture S of andEnable is
begin
	ENABLE_DCD <= not EXTENDED_ALFA and not BREAK_ALFA;
end S;