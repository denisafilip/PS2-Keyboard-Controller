---------------------------------------------------------------------------------------------------
--
-- Title       : muxCatode
-- Design      : project
-- Author      : Denisa
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : muxCatode.vhd
-- Generated   : Thu Apr 23 15:49:33 2020
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
--{entity {muxCatode} architecture {M}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity muxCatode is	 
	generic ( 
		 width: natural := 7
	);
	port (
		SEL: in std_logic_vector(1 downto 0);
		C1, C2, C3, C4: in std_logic_vector(width-1 downto 0);
		CATODE: out std_logic_vector(width-1 downto 0)
	);
end muxCatode;

architecture M of muxCatode is
begin
   	process (SEL, C1, C2, C3, C4)
	begin
		case SEL is
			when "00" => CATODE <= C1;
			when "01" => CATODE <= C2;
			when "10" => CATODE <= C3;
			when "11" => CATODE <= C4;
			when others => CATODE <= C1;
	   end case;
	end process;
end M;
