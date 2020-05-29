---------------------------------------------------------------------------------------------------
--
-- Title       : freqDivider
-- Design      : project
-- Author      : Denisa
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : frequencyDivider.vhd
-- Generated   : Sat Apr 25 18:33:47 2020
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
--{entity {freqDivider} architecture {Z}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity freqDivider is 
	port (
		BOARD_CLK: in STD_LOGIC;
		CLK: out STD_LOGIC := '0'
	);
end freqDivider;

architecture Z of freqDivider is
begin
   	process(BOARD_CLK)
	variable Q: STD_LOGIC_VECTOR(19 downto 0) := "00000000000000000001";
	variable iCLK: STD_LOGIC := '1';
	begin
		if (BOARD_CLK'EVENT) and (BOARD_CLK = '1') then
			Q := Q + 1;	
			if (Q = "00010000010001101010") then 
				CLK <= iCLK;
				iCLK := not iCLK;
				Q := "00000000000000000001";
			end if;
		end if;
	end process;
end Z;
