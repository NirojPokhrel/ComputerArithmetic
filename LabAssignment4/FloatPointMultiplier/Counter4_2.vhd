----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:52:06 11/25/2015 
-- Design Name: 
-- Module Name:    Counter4_2 - Behavioral 
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

entity Counter4_2 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           tin : in  STD_LOGIC;
           tout : out  STD_LOGIC;
           cout : out  STD_LOGIC;
           sum : out  STD_LOGIC);
end Counter4_2;


architecture Behavioral of Counter4_2 is

component FullAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end component;

signal sum_temp: STD_LOGIC;

begin

	u1: FullAdder port map( a=>a, b=>b, cin=>c, sum=>sum_temp, cout=>tout);
	u2: FullAdder port map( a=>sum_temp, b=>d, cin=>tin, sum=>sum, cout=>cout); 


end Behavioral;

