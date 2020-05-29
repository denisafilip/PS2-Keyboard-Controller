---------------------------------------------------------------------------------------------------
--
-- Title       : readAndDecode
-- Design      : project
-- Author      : Denisa
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : readAndDecode.vhd
-- Generated   : Wed Apr 22 18:53:46 2020
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
--{entity {readAndDecode} architecture {readAndDecode}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity readAndDecode is	
	generic (
		width: natural := 7;
		anode_width: natural := 4
	);
	port (	   
		KBD_DATA: in STD_LOGIC;
		KBD_CLK: in STD_LOGIC;
		BOARD_CLK: in STD_LOGIC;
		CATODE: out STD_LOGIC_VECTOR(width-1 downto 0);
		ANODE: out STD_LOGIC_VECTOR(anode_width-1 downto 0);
		DP: out STD_LOGIC
	);
end readAndDecode;

architecture structural of readAndDecode is	
	component SR 
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
	end component;
	
	component SR_BETA
		generic ( 
			width: natural := 8
		);
		port (
			BETA: out STD_LOGIC_VECTOR(width-1 downto 0);
			KBD_CLK: in STD_LOGIC;
			Q: in STD_LOGIC_VECTOR(3 downto 0);
			ALFA_OK: in STD_LOGIC;
			ALFA: in STD_LOGIC_VECTOR(width-1 downto 0)
		);
	end component; 	
	
	component COMPARATOR	
		generic (
			N: natural := 8
		);
		port (
			CONST: in STD_LOGIC_VECTOR(N-1 downto 0);
			CODE: in STD_LOGIC_VECTOR(N-1 downto 0);
			EQUAL: out STD_LOGIC
		);
	end component; 
	
	component PARITY_CHECK 
		generic (
			width: natural := 8
		);
		port (
			CODE: in STD_LOGIC_VECTOR(width-1 downto 0);
			PB: in STD_LOGIC;
			PARITY_OK: out STD_LOGIC
		);
	end component;
	
	component andGate
		port ( 
			Q: in STD_LOGIC_VECTOR(3 downto 0);
			LEFT, RIGHT: in STD_LOGIC;
			BREAK1: in STD_LOGIC;
			BREAK2: in STD_LOGIC;
			ALFA_OK: in STD_LOGIC; 
			EXTENDED_ALFA: in STD_LOGIC;
			ENABLE_REG: out STD_LOGIC
		);
	end component;	 
	
	component DCD  
		port (
			ALFA: in STD_LOGIC_VECTOR(7 downto 0); 
			SIMPLE_KEY: out STD_LOGIC_VECTOR(6 downto 0) := "1111111"
		);
	end component; 
	
	component EDCD
		port ( 
			ALFA: in STD_LOGIC_VECTOR(7 downto 0);
			SPECIAL_KEY: out STD_LOGIC_VECTOR(6 downto 0) := "1111111"
		);
	end component;
	
	component MUX
		generic (
			width: natural := 7
		);
		port (
			SIMPLE_KEY: in STD_LOGIC_VECTOR(width-1 downto 0);
			SPECIAL_KEY: in STD_LOGIC_VECTOR(width-1 downto 0);
			KEY_CODE: out STD_LOGIC_VECTOR(width-1 downto 0) := "1111111";
			EXTENDED: in STD_LOGIC --selection input
		);
	end component; 
	
	component andEnable
		port (
			EXTENDED_ALFA, BREAK_ALFA: in STD_LOGIC;
			ENABLE_DCD: out STD_LOGIC
		);
	end component;
	
	component orEnable
		port (
			INPUT1, INPUT2: in STD_LOGIC;
			EXTENDED: in STD_LOGIC;
			Q: in STD_LOGIC_VECTOR(3 downto 0);
			OUTPUT: out STD_LOGIC
		);
	end component;

	--display
	component displayReg
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
	end component;
	
	component muxCatode	 
		generic ( 
			 width: natural := 7
		);
		port (
			SEL: in std_logic_vector(1 downto 0);
			C1, C2, C3, C4: in std_logic_vector(width-1 downto 0);
			CATODE: out std_logic_vector(width-1 downto 0)
		);
	end component;	
	
	component counter2
		generic (  
			width: natural := 2
		);
		port (
			BOARD_CLK: in STD_LOGIC;
			Q: out STD_LOGIC_VECTOR(width-1 downto 0)
		);
	end component;
	
	component muxAnode
		generic (
			width: natural := 4
		);
		port(
			SEL: in std_logic_vector(1 downto 0);
			C1, C2, C3, C4: in std_logic_vector(3 downto 0);
			ANODE: out std_logic_vector(3 downto 0)
		);
	end component;
	
	component bidirSR
		generic ( 
			width: natural := 4
		);
		port(
			SL, SR, CLK: in std_logic;
			Q: out std_logic_vector(width-1 downto 0)
		);
	end component; 
	
	component muxDP
		port(
			SEL: in std_logic_vector(1 downto 0);
			C1, C2, C3, C4: in std_logic;
			DP: out std_logic
		);
	end component;	
	
	component freqDivider 
		port (
			BOARD_CLK: in STD_LOGIC;
			CLK: out STD_LOGIC := '0'
		);
	end component;	 
	
	component orDoubleKeys
		port (
			INPUT1, INPUT2: in STD_LOGIC;
			OUTPUT: out STD_LOGIC
		);
	end component;	

signal intQ: STD_LOGIC_VECTOR(3 downto 0); 
signal sQ: STD_LOGIC_VECTOR(3 downto 0);
signal ENABLE_REG: STD_LOGIC := '0';
signal ALFA, BETA: STD_LOGIC_VECTOR(7 downto 0); 
signal SIMPLE_KEY, SPECIAL_KEY, KEY_CODE, reg1, reg2, reg3, reg4: STD_LOGIC_VECTOR(6 downto 0) := "1111110"; 
signal PB_ALFA, shiftRight, shiftLeft: STD_LOGIC;
signal up, left, right, down, sRight, sLeft, ALFA_OK, EXTENDED_ALFA, EXTENDED_BETA, BREAK_ALFA, BREAK_BETA, BACKSPACE, ESC, TAB, SHIFT, ALT, CTRL: STD_LOGIC;
signal anQ: std_logic_vector(1 downto 0);
signal RST: std_logic := '0'; 
signal CLK: STD_LOGIC := '0';
begin
	--read and decode
	alfa_sr: SR port map(KBD_DATA, ALFA, PB_ALFA, KBD_CLK, intQ);	
	PCAlfa: PARITY_CHECK port map(ALFA, PB_ALFA, ALFA_OK);
	beta_sr: SR_BETA port map(BETA, KBD_CLK, intQ, ALFA_OK, ALFA);
	compExtendedBeta: COMPARATOR port map("11100000", BETA, EXTENDED_BETA);
	compExtendedAlfa: COMPARATOR port map("11100000", ALFA, EXTENDED_ALFA);
	compBreakBeta: COMPARATOR port map("11110000", BETA, BREAK_BETA);
	compBreakAlfa: COMPARATOR port map("11110000", ALFA, BREAK_ALFA);
	simpleDCD: DCD port map(ALFA, SIMPLE_KEY);
	extendedDCD: EDCD port map(ALFA, SPECIAL_KEY); 
	muxCode: MUX port map(SIMPLE_KEY, SPECIAL_KEY, KEY_CODE, EXTENDED_BETA); 
	divider: freqDivider port map(BOARD_CLK, CLK);
	
	--display
	compEnter: COMPARATOR port map("01011010", ALFA, RST);
	compUp: COMPARATOR port map("01110101", ALFA, up);
	compLeft: COMPARATOR port map("01101011", ALFA, left);
	compRight: COMPARATOR port map("01110100", ALFA, right);
	compDown: COMPARATOR port map("01110010", ALFA, down);	 
	orRight: orEnable port map(up, right, EXTENDED_BETA, intQ, sRight);
	orLeft: orEnable port map(down, left, EXTENDED_BETA, intQ, sLeft);
	enableReg: andGate port map(intQ, sRight, sLeft, BREAK_ALFA, BREAK_BETA, ALFA_OK, EXTENDED_ALFA, ENABLE_REG);
	compBackspace: COMPARATOR port map("01100110", ALFA, BACKSPACE);  
	compESC: COMPARATOR port map("01110110", ALFA, ESC);  
	compTAB: COMPARATOR port map("00001101", ALFA, TAB); 
	compCTRLleft: COMPARATOR port map("00010100", ALFA, CTRL); 	
	compALTleft: COMPARATOR port map("00010001", ALFA, ALT);  
	compSHIFTleft: COMPARATOR port map("00010010", ALFA, shiftLeft); 
	compSHIFTright: COMPARATOR port map("01011001", ALFA, shiftRight); 
	shiftKey: orDoubleKeys port map(shiftLeft, shiftRight, SHIFT);
	r4: displayReg port map(reg3, "1111111", reg1, "1111111", reg1, "0100100", "0110001", BACKSPACE, ESC, TAB, ALT, SHIFT, CTRL, ENABLE_REG, reg4, RST, KBD_CLK);
	r3: displayReg port map(reg2, reg4, "0110000", "1111111", "0001000", "1001000", "1110000", BACKSPACE, ESC, TAB, ALT, SHIFT, CTRL, ENABLE_REG, reg3, RST, KBD_CLK);
	r2: displayReg port map(reg1, reg3, "0100100", reg4, "1110001", "0111000", "0001000", BACKSPACE, ESC, TAB, ALT, SHIFT, CTRL, ENABLE_REG, reg2, RST, KBD_CLK);
	r1: displayReg port map(KEY_CODE, reg2, "0110001", reg3, "1110000", "1110000", "1110001", BACKSPACE, ESC, TAB, ALT, SHIFT, CTRL, ENABLE_REG, reg1, RST, KBD_CLK); 
	counterAnode: counter2 port map(CLK, anQ);
	muxForCatode: muxCatode port map(anQ, reg1, reg2, reg3, reg4, CATODE); 
	muxForAnode: muxAnode port map(anQ, "1110", "1101", "1011", "0111", ANODE);
	biSR: bidirSR port map(sLeft, sRight, KBD_CLK, sQ);
	muxForDP: muxDP port map(anQ, sQ(0), sQ(1), sQ(2), sQ(3), DP);
end structural;
