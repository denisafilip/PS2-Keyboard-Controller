---------------------------------------------------------------------------------------------------
--
-- Title       : bidirSR
-- Design      : project
-- Author      : Denisa
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : biShiftReg.vhd
-- Generated   : Thu Apr 23 16:26:11 2020
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
--{entity {bidirSR} architecture {P}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity bidirSR is 
	generic ( 
		width: natural := 4
	);
	port(
		SL, SR, CLK: in std_logic;
		Q: out std_logic_vector(width-1 downto 0)
	);
end bidirSR;

architecture P of bidirSR is
begin
	process(CLK, SL, SR)
	variable iQ: std_logic_vector(3 downto 0) := "1110";
	begin
			if(CLK'EVENT) and (CLK = '1') then
				if(SL = '1') then
					if(iQ(3) = '0') then
						iQ := "1110";
					else
						for i in 3 downto 1 loop
							iQ(i) := iQ(i-1);
						end loop;
						iQ(0) := '1';
					end if;
				end if;
				if(SR = '1') then
					if(iQ(0) = '0') then
						iQ := "0111";
					else
						for i in 0 to 2 loop
							iQ(i) := iQ(i+1);
						end loop;
						iQ(3) := '1';
					end if;
				end if;
			end if;
	Q <= iQ;
	end process;

end P;
