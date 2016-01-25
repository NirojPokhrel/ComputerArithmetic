----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:27:44 12/20/2015 
-- Design Name: 
-- Module Name:    BoothMultiplier16bit - Behavioral 
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

entity BoothMultiplier16bit is
    Port ( Ain : in  STD_LOGIC_VECTOR (15 downto 0);
           Bin : in  STD_LOGIC_VECTOR (15 downto 0);
           Product : out  STD_LOGIC_VECTOR (31 downto 0));
end BoothMultiplier16bit;

architecture Behavioral of BoothMultiplier16bit is

component PartialProductAccumulator is
    Port ( Ain : in  STD_LOGIC_VECTOR (15 downto 0);
           Bin : in  STD_LOGIC_VECTOR (15 downto 0);
           PP0 : out  STD_LOGIC_VECTOR (16 downto 0);
           PP1 : out  STD_LOGIC_VECTOR (16 downto 0);
           PP2 : out  STD_LOGIC_VECTOR (16 downto 0);
           PP3 : out  STD_LOGIC_VECTOR (16 downto 0);
           PP4 : out  STD_LOGIC_VECTOR (16 downto 0);
           PP5 : out  STD_LOGIC_VECTOR (16 downto 0);
           PP6 : out  STD_LOGIC_VECTOR (16 downto 0);
           PP7 : out  STD_LOGIC_VECTOR (16 downto 0));
end component;
component CarrySaveAdder_tree is
    Port ( PP0 : in  STD_LOGIC_VECTOR (16 downto 0);
           PP1 : in  STD_LOGIC_VECTOR (16 downto 0);
           PP2 : in  STD_LOGIC_VECTOR (16 downto 0);
           PP3 : in  STD_LOGIC_VECTOR (16 downto 0);
           PP4 : in  STD_LOGIC_VECTOR (16 downto 0);
           PP5 : in  STD_LOGIC_VECTOR (16 downto 0);
           PP6 : in  STD_LOGIC_VECTOR (16 downto 0);
           PP7 : in  STD_LOGIC_VECTOR (16 downto 0);
           Sum : out  STD_LOGIC_VECTOR (31 downto 0);
           Cout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
component CarryLookAhead32bit is
    Port ( Ain : in  STD_LOGIC_VECTOR (31 downto 0);
           Bin : in  STD_LOGIC_VECTOR (31 downto 0);
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (31 downto 0);
           Cout : out  STD_LOGIC);
end component;

signal PP0, PP1, PP2, PP3, PP4, PP5, PP6, PP7: STD_LOGIC_VECTOR( 16 downto 0 );
signal Sum, Cout, Cout_shift: STD_LOGIC_VECTOR( 31 downto 0);

begin

	u0: PartialProductAccumulator port map( Ain=>Ain, Bin=>Bin, PP0=>PP0, PP1=>PP1, PP2=>PP2, PP3=>PP3, 
														PP4=>PP4, PP5=>PP5, PP6=>PP6, PP7=>PP7 );
	u1: CarrySaveAdder_tree port map( PP0=>PP0, PP1=>PP1, PP2=>PP2, PP3=>PP3, 
														PP4=>PP4, PP5=>PP5, PP6=>PP6, PP7=>PP7, Sum=>Sum, Cout=>Cout );
	Cout_shift <= Cout(30 downto 0) & '0';
	u2: CarryLookAhead32bit port map( Ain=>Sum, Bin=>Cout_shift, Cin=>'0', Sum=>Product );

end Behavioral;

