---------------------------------------------------------------------------------------------------
--
-- Title       : SR_BETA
-- Design      : project
-- Author      : Denisa
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : shift_regBeta.vhd
-- Generated   : Sun Apr 12 19:22:22 2020
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
--{entity {SR_BETA} architecture {BETA}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SR_BETA is
		generic ( 
		width: natural := 8
	);
	port (
		BETA: out STD_LOGIC_VECTOR(width-1 downto 0);
		KBD_CLK: in STD_LOGIC;
		Q: in STD_LOGIC_VECTOR(3 downto 0);
		ALFA_OK: in STD_LOGIC;
		ALFA: in STD_LOGIC_VECTOR(width-1 downto 0)
	);
end SR_BETA;

architecture BETA of SR_BETA is
begin
	SR_BETA: process(Q, KBD_CLK, ALFA_OK)	 
	begin	
		if (KBD_CLK'EVENT) and (KBD_CLK = '1') and (Q = "1010") and (ALFA_OK = '1') then 
				BETA <= ALFA;
			end if;	
	end process SR_BETA;
end BETA;
