---------------------------------------------------------------------------------------------------
--
-- Title       : counter2
-- Design      : project
-- Author      : Denisa
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : counter2bits.vhd
-- Generated   : Thu Apr 23 15:55:48 2020
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
--{entity {counter2} architecture {N}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_unsigned.all;

entity counter2 is
	generic (  
		width: natural := 2
	);
	port (
		BOARD_CLK: in STD_LOGIC;
		Q: out STD_LOGIC_VECTOR(width-1 downto 0)
	);
end counter2;

architecture N of counter2 is
begin
	process (BOARD_CLK)
	variable iQ: std_logic_vector(1 downto 0) := "11";
	begin
		if(BOARD_CLK'EVENT) and (BOARD_CLK = '1') then
			iQ := iQ + 1;
		end if;
	Q <= iQ;
	end process;
end N;
