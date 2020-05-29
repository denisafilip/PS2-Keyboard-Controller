---------------------------------------------------------------------------------------------------
--
-- Title       : displayReg
-- Design      : project
-- Author      : Denisa
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : displayReg.vhd
-- Generated   : Thu Apr 23 15:24:21 2020
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
--{entity {displayReg} architecture {K}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity displayReg is
	generic (
		width: natural := 7
	);
	port(
		KEY_CODE1, KEY_CODE2, KEY_CODE3, KEY_CODE4, KEY_CODE5, KEY_CODE6, KEY_CODE7: in std_logic_vector(width-1 downto 0) := "1111111";
	  	BACKSPACE, ESC, TAB, ALT, SHIFT, CTRL: in STD_LOGIC;
		ENABLE_REG: in std_logic := '0';
		CODE: out std_logic_vector(width-1 downto 0) := "1111111";
		RST: in STD_LOGIC;
		CLK: in std_logic
	);
end displayReg;
											  
architecture K of displayReg is	 
begin
	parallel_load: process(CLK, ENABLE_REG, RST, BACKSPACE)
	variable Q: STD_LOGIC_VECTOR(6 downto 0) := "1111111";
	begin

		if (CLK'EVENT) and (CLK = '1') then	  
			if (ENABLE_REG = '1') then 
				if (RST = '1') then
					Q := "1111111"; 
				else 
					if (BACKSPACE = '1') then
						Q := KEY_CODE2;	
					elsif (ESC = '1') then
						Q := KEY_CODE3;	 
					elsif (TAB = '1') then
						Q := KEY_CODE4;
					elsif (ALT = '1') then 
						Q := KEY_CODE5;
					elsif (SHIFT = '1') then 
						Q := KEY_CODE6;	
					elsif (CTRL = '1') then 
						Q := KEY_CODE7;	
					else
						Q := KEY_CODE1;
					end if;
				end if;
			end if;
		end if;
	CODE <= Q;
	end process parallel_load;
end K;
