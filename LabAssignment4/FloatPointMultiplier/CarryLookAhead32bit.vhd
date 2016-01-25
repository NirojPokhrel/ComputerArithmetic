----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:20:50 12/20/2015 
-- Design Name: 
-- Module Name:    CarryLookAhead32bit - Behavioral 
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

entity CarryLookAhead32bit is
    Port ( Ain : in  STD_LOGIC_VECTOR (31 downto 0);
           Bin : in  STD_LOGIC_VECTOR (31 downto 0);
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (31 downto 0);
           Cout : out  STD_LOGIC);
end CarryLookAhead32bit;

architecture Behavioral of CarryLookAhead32bit is
component CarryLookAhead16bit is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (15 downto 0);
			  cout: out STD_LOGIC);
end component;

signal sum_temp0, sum_temp1: STD_LOGIC_VECTOR( 15 downto 0);
signal cout_sel, cout_temp0, cout_temp1: STD_LOGIC;
begin

	u0: CarryLookAhead16bit port map( a=>Ain(15 downto 0), b=>Bin(15 downto 0), cin=>Cin, 
		 Sum=>Sum(15 downto 0), cout=>cout_sel );
	u1: CarryLookAhead16bit port map( a=>Ain(31 downto 16), b=>Bin(31 downto 16), cin=>'0', 
		 Sum=>sum_temp0, cout=>cout_temp0 );
	u2: CarryLookAhead16bit port map( a=>Ain(31 downto 16), b=>Bin(31 downto 16), cin=>'1', 
		 Sum=>sum_temp1, cout=>cout_temp1 );
	
	Sum(31 downto 16 ) <= sum_temp0 when cout_sel = '0' else
								 sum_temp1;
	Cout <= cout_temp0 when cout_sel = '0' else
			  cout_temp1;

end Behavioral;

