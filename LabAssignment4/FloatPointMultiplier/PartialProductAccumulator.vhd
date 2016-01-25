----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:34:19 12/20/2015 
-- Design Name: 
-- Module Name:    PartialProductAccumulator - Behavioral 
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

entity PartialProductAccumulator is
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
end PartialProductAccumulator;

architecture Behavioral of PartialProductAccumulator is

component PartialProductGenerator is
    Port ( Ain : in  STD_LOGIC_VECTOR (15 downto 0);
           Sel : in  STD_LOGIC_VECTOR (2 downto 0);
           Pproduct : out  STD_LOGIC_VECTOR (16 downto 0));
end component;
signal Sel: STD_LOGIC_VECTOR(16 downto 0 );
begin

	Sel <= Bin & '0';
	u0: PartialProductGenerator port map( Ain=>Ain, Sel=>Sel(2 downto 0), Pproduct=>PP0);
	u1: PartialProductGenerator port map( Ain=>Ain, Sel=>Sel(4 downto 2), Pproduct=>PP1);
	u2: PartialProductGenerator port map( Ain=>Ain, Sel=>Sel(6 downto 4), Pproduct=>PP2);
	u3: PartialProductGenerator port map( Ain=>Ain, Sel=>Sel(8 downto 6), Pproduct=>PP3);
	u4: PartialProductGenerator port map( Ain=>Ain, Sel=>Sel(10 downto 8), Pproduct=>PP4);
	u5: PartialProductGenerator port map( Ain=>Ain, Sel=>Sel(12 downto 10), Pproduct=>PP5);
	u6: PartialProductGenerator port map( Ain=>Ain, Sel=>Sel(14 downto 12), Pproduct=>PP6);
	u7: PartialProductGenerator port map( Ain=>Ain, Sel=>Sel(16 downto 14), Pproduct=>PP7);

end Behavioral;

