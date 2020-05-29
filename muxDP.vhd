---------------------------------------------------------------------------------------------------
--
-- Title       : muxDP
-- Design      : project
-- Author      : Denisa
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : muxDP.vhd
-- Generated   : Thu Apr 23 16:31:45 2020
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
--{entity {muxDP} architecture {R}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity muxDP is
	port(
		SEL: in std_logic_vector(1 downto 0);
		C1, C2, C3, C4: in std_logic;
		DP: out std_logic
	);
end muxDP;

architecture R of muxDP is
begin
	process (SEL, C1, C2, C3, C4)
	begin
		case SEL is
			when "00" => DP <= C1;
			when "01" => DP <= C2;
			when "10" => DP <= C3;
			when "11" => DP <= C4;
			when others => DP <= C1;
	   end case;
	end process;
end R;
