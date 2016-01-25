----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:56:41 12/20/2015 
-- Design Name: 
-- Module Name:    PartialProductGenerator - Behavioral 
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

entity PartialProductGenerator is
    Port ( Ain : in  STD_LOGIC_VECTOR (15 downto 0);
           Sel : in  STD_LOGIC_VECTOR (2 downto 0);
           Pproduct : out  STD_LOGIC_VECTOR (16 downto 0));
end PartialProductGenerator;

architecture Behavioral of PartialProductGenerator is

component TwosComplementOfANumber is
    Port ( Ain : in  STD_LOGIC_VECTOR (15 downto 0);
           Aout : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
signal TwosComplementOfAin: STD_LOGIC_VECTOR(15 downto 0);

begin
	u1: TwosComplementOfANumber port map( Ain=>Ain, Aout=>TwosComplementOfAin);
	Pproduct <= (Others=>'0') when Sel = "000" else
					( Ain(15) & Ain ) when Sel = "001" else
					( Ain(15) & Ain ) when Sel = "010" else
					( Ain & '0' ) when Sel = "011" else
					( TwosComplementOfAin & '0' ) when Sel = "100" else
					( TwosComplementOfAin(15) & TwosComplementOfAin ) when Sel = "101" else
					( TwosComplementOfAin(15) & TwosComplementOfAin ) when Sel = "110" else
					(Others=>'0');

end Behavioral;

