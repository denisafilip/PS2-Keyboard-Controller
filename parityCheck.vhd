---------------------------------------------------------------------------------------------------
--
-- Title       : PARITY_CHECK
-- Design      : project
-- Author      : Denisa
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : parityCheck.vhd
-- Generated   : Sun Apr 12 20:18:05 2020
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

--odd parity   
--the parity bit is 1 if there is an even number of ones, and 0 if there is an odd number of ones

entity PARITY_CHECK is 
	generic (
		width: natural := 8
	);
	port (
		CODE: in STD_LOGIC_VECTOR(width-1 downto 0);
		PB: in STD_LOGIC;
		PARITY_OK: out STD_LOGIC
	);
end PARITY_CHECK;

architecture C of PARITY_CHECK is 
signal CHAIN: STD_LOGIC_VECTOR(width downto 0);
begin
	chain(width) <= '0';
	L1: for i in CODE'RANGE generate
		CHAIN(i) <= CHAIN(i+1) xor CODE(i);
	end generate;
	PARITY_OK <= CHAIN(0) xor PB;
end C;
