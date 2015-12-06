----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:49:06 11/25/2015 
-- Design Name: 
-- Module Name:    CarrySaveAdder_16bits - Behavioral 
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

entity CarrySaveAdder_16bits is
    Port ( a : in  STD_LOGIC_VECTOR (14 downto 0);
           b : in  STD_LOGIC_VECTOR (14 downto 0);
           c : in  STD_LOGIC_VECTOR (14 downto 0);
           d : in  STD_LOGIC_VECTOR (14 downto 0);
           sum : out  STD_LOGIC_VECTOR (14 downto 0);
           cout : out  STD_LOGIC_VECTOR (14 downto 0));
end CarrySaveAdder_16bits;

architecture Behavioral of CarrySaveAdder_16bits is

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

signal t_gen: STD_LOGIC_VECTOR( 15 downto 0 ) := "0000000000000000";
begin

	
	GEN_ADDER_BLOCK:
		for i in 0 to 14 generate
			u5: Counter4_2 port map( a=>a(i), b=>b(i), c=>c(i), d=>d(i), tin=>t_gen(i), 
												tout=>t_gen(i+1), sum=>sum(i), cout=>cout(i) );
		end generate GEN_ADDER_BLOCK;

end Behavioral;

