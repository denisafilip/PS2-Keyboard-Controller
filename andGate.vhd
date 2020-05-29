---------------------------------------------------------------------------------------------------
--
-- Title       : \and\
-- Design      : project
-- Author      : Denisa
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : andGate.vhd
-- Generated   : Mon Apr 13 11:56:10 2020
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

entity andGate is
	port (	
		Q: in STD_LOGIC_VECTOR(3 downto 0);
		LEFT, RIGHT: in STD_LOGIC;
		BREAK1: in STD_LOGIC;
		BREAK2: in STD_LOGIC;
		ALFA_OK: in STD_LOGIC;
		EXTENDED_ALFA: in STD_LOGIC; 
		ENABLE_REG: out STD_LOGIC
	);
end andGate;

architecture E of andGate is
begin  
	process(Q, BREAK1, BREAK2, EXTENDED_ALFA, ALFA_OK, LEFT, RIGHT)
	begin
		if (Q >= "0001") then
			ENABLE_REG <= '0';
		else
			ENABLE_REG <= not BREAK1 and not BREAK2 and ALFA_OK and not EXTENDED_ALFA and not LEFT and not RIGHT;
		end if;
	end process;
end E;