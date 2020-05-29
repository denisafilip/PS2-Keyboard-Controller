---------------------------------------------------------------------------------------------------
--
-- Title       : muxAnode
-- Design      : project
-- Author      : Denisa
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : muxAnode.vhd
-- Generated   : Thu Apr 23 16:13:52 2020
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
--{entity {muxAnode} architecture {O}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity muxAnode is 
	generic (
		width: natural := 4
	);
	port(
		SEL: in std_logic_vector(1 downto 0);
		C1, C2, C3, C4: in std_logic_vector(3 downto 0);
		ANODE: out std_logic_vector(3 downto 0)
	);
end muxAnode;

--}} End of automatically maintained section

architecture O of muxAnode is
begin
	process (SEL, C1, C2, C3, C4)
	begin
		case SEL is
			when "00" => ANODE <= C1;
			when "01" => ANODE <= C2;
			when "10" => ANODE <= C3;
			when "11" => ANODE <= C4;
			when others => ANODE <= C1;
	   end case;
	end process;	
end O;
