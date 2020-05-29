---------------------------------------------------------------------------------------------------
--
-- Title       : DCD
-- Design      : project
-- Author      : Denisa
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : Decoder.vhd
-- Generated   : Sun Apr 12 23:42:13 2020
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
--{entity {DCD} architecture {D}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity DCD is  
	port (
		ALFA: in STD_LOGIC_VECTOR(7 downto 0); 
		SIMPLE_KEY: out STD_LOGIC_VECTOR(6 downto 0) := "1111110"
	);
end DCD;

architecture D of DCD is
begin
	SIMPLE: process(ALFA) 
	begin
			case ALFA is
				when "01000101" => SIMPLE_KEY <= "0000001"; --0 - 45
				when "00010110" => SIMPLE_KEY <= "1001111"; --1 - 16
				when "00011110" => SIMPLE_KEY <= "0010010"; --2 - 1E
				when "00100110" => SIMPLE_KEY <= "0000110"; --3	- 26
				when "00100101" => SIMPLE_KEY <= "1001100"; --4	- 25
				when "00101110" => SIMPLE_KEY <= "0100100"; --5 - 2E
				when "00110110" => SIMPLE_KEY <= "0100000"; --6	- 36
				when "00111101" => SIMPLE_KEY <= "0001111"; --7	- 3D
				when "00111110" => SIMPLE_KEY <= "0000000"; --8 - 3E
				when "01000110" => SIMPLE_KEY <= "0000100"; --9	- 46
				when "00011100" => SIMPLE_KEY <= "0001000"; --A - 1C
				when "00110010" => SIMPLE_KEY <= "1100000"; --b	- 32
				when "00100001" => SIMPLE_KEY <= "0110001"; --C - 21
				when "00100011" => SIMPLE_KEY <= "1000010"; --d	- 23
				when "00100100" => SIMPLE_KEY <= "0110000"; --E - 24
				when "00101011" => SIMPLE_KEY <= "0111000"; --F	- 2B
				when "00110100" => SIMPLE_KEY <= "0100000"; --G - 34 
				when "00110011" => SIMPLE_KEY <= "1101000"; --H	- 33
				when "01000011" => SIMPLE_KEY <= "1001111"; --I - 43
				when "00111011" => SIMPLE_KEY <= "1000111"; --J	- 3B
				when "01000010" => SIMPLE_KEY <= "1001000"; --K - 42 
				when "01001011" => SIMPLE_KEY <= "1110001"; --L	- 4B 
				when "00111010" => SIMPLE_KEY <= "0101010"; --M	- 3A
				when "00110001" => SIMPLE_KEY <= "0001001"; --N - 31 
				when "01000100" => SIMPLE_KEY <= "0000001"; --O - 44
				when "01001101" => SIMPLE_KEY <= "0011000"; --P	- 4D
				when "00010101" => SIMPLE_KEY <= "0001100"; --Q - 15
				when "00101101" => SIMPLE_KEY <= "0001000"; --R	- 2D
				when "00011011" => SIMPLE_KEY <= "0100100"; --S - 1B
				when "00101100" => SIMPLE_KEY <= "1110000"; --T - 2C 
				when "00111100" => SIMPLE_KEY <= "1000001"; --U	- 3C 
				when "00101010" => SIMPLE_KEY <= "1100011"; --V	- 2A
				when "00011101" => SIMPLE_KEY <= "1000000"; --W - 1D 
				when "00100010" => SIMPLE_KEY <= "1001000"; --X - 22
				when "00110101" => SIMPLE_KEY <= "1000100"; --Y	- 35 
				when "00011010" => SIMPLE_KEY <= "0010010"; --Z	- 1A 
				when "01001110" => SIMPLE_KEY <= "1111110"; -- -	- 4E  
				when "01010101" => SIMPLE_KEY <= "0111110"; -- =	
				when "00001110" => SIMPLE_KEY <= "1111101"; -- ' 
				when "01010010" => SIMPLE_KEY <= "1111101"; -- ' 
				when "01011011" => SIMPLE_KEY <= "0000111"; -- ]
				when "01010100" => SIMPLE_KEY <= "0110001"; -- [
				when "01001010" => SIMPLE_KEY <= "1011010"; -- /  
				when "01011101" => SIMPLE_KEY <= "1101100"; -- \  
				when "01000001" => SIMPLE_KEY <= "1110010"; -- < 
				when "01001001" => SIMPLE_KEY <= "1100110"; -- >  
				when "01001100" => SIMPLE_KEY <= "1111001"; -- :
				when "01011000" => SIMPLE_KEY <= "0110001"; -- caps lock
				when "01110111" => SIMPLE_KEY <= "0001001"; -- num lock	
				when "01111110" => SIMPLE_KEY <= "0100100"; -- scroll lock
				
				when "00000101" => SIMPLE_KEY <= "1111011"; --F1
				when "00000110" => SIMPLE_KEY <= "1111001"; --F2
				when "00000100" => SIMPLE_KEY <= "0111001"; --F3
				when "00001100" => SIMPLE_KEY <= "0111000"; --F4
				when "00000011" => SIMPLE_KEY <= "0111001"; --F5
				when "00001011" => SIMPLE_KEY <= "1111001"; --F6
				when "10000011" => SIMPLE_KEY <= "1111011"; --F7
				when "00001010" => SIMPLE_KEY <= "1111001"; --F8
				when "00000001" => SIMPLE_KEY <= "0111001"; --F9
				when "00001001" => SIMPLE_KEY <= "0111000"; --F10
				when "01111000" => SIMPLE_KEY <= "0111001"; --F11
				when "00000111" => SIMPLE_KEY <= "1111001"; --F12
				--numpad
				when "01110000" => SIMPLE_KEY <= "0000001"; --0 - 70
				when "01101001" => SIMPLE_KEY <= "1001111"; --1	- 69
				when "01110010" => SIMPLE_KEY <= "0010010"; --2 - 72
				when "01111010" => SIMPLE_KEY <= "0000110"; --3 - 7A 
				when "01101011" => SIMPLE_KEY <= "1001100"; --4	- 6B 
				when "01110011" => SIMPLE_KEY <= "0100100"; --5	- 73
				when "01110100" => SIMPLE_KEY <= "0100000"; --6 - 74
				when "01101100" => SIMPLE_KEY <= "0001111"; --7 - 6C
				when "01110101" => SIMPLE_KEY <= "0000000"; --8	- 75 
				when "01111101" => SIMPLE_KEY <= "0000100"; --9	- 7D
				when "01111011" => SIMPLE_KEY <= "1111110"; -- - - 7B 
				when "01111001" => SIMPLE_KEY <= "1001110"; -- + 
				when "01111100" => SIMPLE_KEY <= "1111000"; -- *
				when "01110001" => SIMPLE_KEY <= "1111111"; -- delete - 71
				when others => SIMPLE_KEY <= "1111111";
			end case; 
	end process SIMPLE;
end D;
