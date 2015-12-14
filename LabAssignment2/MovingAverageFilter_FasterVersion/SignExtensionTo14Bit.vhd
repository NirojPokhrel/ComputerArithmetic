----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:17:56 11/25/2015 
-- Design Name: 
-- Module Name:    SignExtensionTo14Bit - Behavioral 
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

entity SignExtensionTo14Bit is
    Port ( a : in  STD_LOGIC_VECTOR (10 downto 0);
           b : out  STD_LOGIC_VECTOR (14 downto 0));
end SignExtensionTo14Bit;

architecture Behavioral of SignExtensionTo14Bit is

begin

	b <= ("1111" & a ) when a(10) = '1' else
		  ("0000" & a );


end Behavioral;

