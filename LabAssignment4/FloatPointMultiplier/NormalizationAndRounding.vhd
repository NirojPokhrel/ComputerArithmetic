----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:38:03 01/25/2016 
-- Design Name: 
-- Module Name:    NormalizationAndRounding - Behavioral 
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

entity NormalizationAndRounding is
    Port ( Ain : in  STD_LOGIC_VECTOR (29 downto 0);
           SignificantOut : out  STD_LOGIC_VECTOR (13 downto 0);
           IncExp : out  STD_LOGIC);
end NormalizationAndRounding;

architecture Behavioral of NormalizationAndRounding is

begin

	GEN_IF_AIN_29_1:
		if Ain(29) = '1' generate
			IncExp <= Ain(29);
			SignificantOut <= Ain(28 downto 15);
		end GEN_IF_AIN_29_1;
	GEN_IF_AIN_29_0:
		if Ain(29) = '0' generate
			IncExp <= '0';
			SignificantOut <= Ain(27 downto 14);
		end GEN_IF_AIN_29_0;
		
end Behavioral;

