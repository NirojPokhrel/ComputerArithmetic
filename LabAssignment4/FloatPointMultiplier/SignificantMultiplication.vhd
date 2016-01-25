----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:31:40 01/25/2016 
-- Design Name: 
-- Module Name:    SignificantMultiplication - Behavioral 
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

entity SignificantMultiplication is
    Port ( Ain : in  STD_LOGIC_VECTOR (13 downto 0);
           Bin : in  STD_LOGIC_VECTOR (13 downto 0);
           Product : out  STD_LOGIC_VECTOR (29 downto 0));
end SignificantMultiplication;

architecture Behavioral of SignificantMultiplication is

component BoothMultiplier16bit is
    Port ( Ain : in  STD_LOGIC_VECTOR (15 downto 0);
           Bin : in  STD_LOGIC_VECTOR (15 downto 0);
           Product : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal Ain_temp, Bin_temp: STD_LOGIC_VECTOR(15 downto 0);
signal Product_temp: STD_LOGIC_VECTOR(31 downto 0);

begin

	Ain_temp <= "01" & Ain;
	Bin_temp <= "01" & Bin;
	
	u0: BoothMultiplier16bit port map( Ain=>Ain_temp, Bin=>Bin_temp, Product=>Product_temp );
	Product <= Produt_temp(29 downto 0);

end Behavioral;

