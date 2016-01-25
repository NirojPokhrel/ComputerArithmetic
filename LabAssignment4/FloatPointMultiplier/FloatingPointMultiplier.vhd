----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:01:50 01/25/2016 
-- Design Name: 
-- Module Name:    FloatingPointMultiplier - Behavioral 
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

entity FloatingPointMultiplier is
    Port ( Ain : in  STD_LOGIC_VECTOR (22 downto 0);
           Aout : out  STD_LOGIC_VECTOR (22 downto 0));
end FloatingPointMultiplier;

architecture Behavioral of FloatingPointMultiplier is

begin
	--Check if they are both zero


end Behavioral;

