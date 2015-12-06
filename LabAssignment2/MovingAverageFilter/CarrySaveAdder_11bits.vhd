----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:12:10 11/25/2015 
-- Design Name: 
-- Module Name:    CarrySaveAdder_11bits - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CarrySaveAdder_11bits is
    Port ( a : in  STD_LOGIC_VECTOR (10 downto 0);
           b : in  STD_LOGIC_VECTOR (10 downto 0);
           c : in  STD_LOGIC_VECTOR (10 downto 0);
           d : in  STD_LOGIC_VECTOR (10 downto 0);
           sum : out  STD_LOGIC_VECTOR (14 downto 0);
           cout : out  STD_LOGIC_VECTOR (14 downto 0));
end CarrySaveAdder_11bits;

architecture Behavioral of CarrySaveAdder_11bits is

component SignExtensionTo14Bit is
    Port ( a : in  STD_LOGIC_VECTOR (10 downto 0);
           b : out  STD_LOGIC_VECTOR (14 downto 0));
end component;


component Counter4_2 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           tin : in  STD_LOGIC;
           tout : out  STD_LOGIC;
           cout : out  STD_LOGIC;
           sum : out  STD_LOGIC);
end component;
signal a_temp, b_temp, c_temp, d_temp: STD_LOGIC_VECTOR( 14 downto 0 );
signal t_gen: STD_LOGIC_VECTOR( 15 downto 0 ) := "0000000000000000";

begin
 
	u1: SignExtensionTo14Bit port map( a=>a, b=>a_temp );
	u2: SignExtensionTo14Bit port map( a=>b, b=>b_temp );
	u3: SignExtensionTo14Bit port map( a=>c, b=>c_temp );
	u4: SignExtensionTo14Bit port map( a=>d, b=>d_temp );
	
	GEN_ADDER_BLOCK:
		for i in 0 to 14 generate
			u5: Counter4_2 port map( a=>a_temp(i), b=>b_temp(i), c=>c_temp(i), d=>d_temp(i), tin=>t_gen(i), 
												tout=>t_gen(i+1), sum=>sum(i), cout=>cout(i) );
		end generate GEN_ADDER_BLOCK;

end Behavioral;

