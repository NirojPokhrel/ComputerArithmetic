----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:54:36 12/06/2015 
-- Design Name: 
-- Module Name:    CarryLookAhead16bit - Behavioral 
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

entity CarryLookAhead16bit is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (15 downto 0);
           cout : out  STD_LOGIC);
end CarryLookAhead16bit;

architecture Behavioral of CarryLookAhead16bit is

component CarryLookAhead8bit is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (7 downto 0);
           cout : out  STD_LOGIC);
end component;

signal sum_inter0, sum_inter1 : STD_LOGIC_VECTOR( 7 downto 0 );
signal cout_sel, cout_zero, cout_one: STD_LOGIC;
begin

	u1: CarryLookAhead8bit port map( a=>a(7 downto 0), b=>b(7 downto 0), cin=>cin,sum=>sum(7 downto 0), cout=>cout_sel);
	u2: CarryLookAhead8bit port map( a=>a(15 downto 8), b=>b(15 downto 8), cin=>'0',sum=>sum_inter0, cout=>cout_zero);
	u3: CarryLookAhead8bit port map( a=>a(15 downto 8), b=>b(15 downto 8), cin=>'1',sum=>sum_inter1, cout=>cout_one);

	sum(15 downto 8) <= sum_inter0 when cout_sel = '0' else
							  sum_inter1;
	cout <= cout_zero when cout_sel = '0' else
			  cout_one;

end Behavioral;

