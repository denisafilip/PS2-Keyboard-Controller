---------------------------------------------------------------------------------------------------
--
-- Title       : SR
-- Design      : project
-- Author      : Denisa
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : shift_reg1.vhd
-- Generated   : Sun Apr 12 18:45:17 2020
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
--{entity {SR} architecture {ALFA}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity SR is  
	generic ( 
		width: natural := 8
	);
	port (
		SI: in STD_LOGIC;  
		ALFA: out STD_LOGIC_VECTOR(width-1 downto 0);
		PB_ALFA: out STD_LOGIC;
		KBD_CLK: in STD_LOGIC;
		Q: out STD_LOGIC_VECTOR(3 downto 0)
	);
end SR;


architecture ALFA of SR is
begin
	SR_ALFA: process(KBD_CLK, SI)	 
	variable VALUES: STD_LOGIC_VECTOR(10 downto 0) := "00000000000"; 
	variable count: STD_LOGIC_VECTOR(3 downto 0) := "0000";
	begin
		if (KBD_CLK'EVENT) and (KBD_CLK = '1') then	
			for i in 0 to 9 loop
				VALUES(i) := VALUES(i+1);
			end loop;
			VALUES(10) := SI;
			count := count + 1;	
			if (count = "1011") then
				ALFA <= VALUES(8 downto 1);
				PB_ALFA <= VALUES(9);
				count := "0000";
			end if;
		end if;	 

		Q <= count;
	end process SR_ALFA;
end ALFA;
