----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:09:58 12/21/2015 
-- Design Name: 
-- Module Name:    SubtractFromTwo - Behavioral 
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

entity SubtractFromTwo is
    Port ( Ain : in  STD_LOGIC_VECTOR (15 downto 0);
           Aout : out  STD_LOGIC_VECTOR (15 downto 0));
end SubtractFromTwo;

architecture Behavioral of SubtractFromTwo is

component TwosComplementOfANumber is
    Port ( Ain : in  STD_LOGIC_VECTOR (15 downto 0);
           Aout : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component CarryLookAhead16bit is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (15 downto 0);
			  cout: out STD_LOGIC);
end component;

signal TwoInFixedDititFormat, TwosComplementOfAin: STD_LOGIC_VECTOR( 15 downto 0);

begin

	TwoInFixedDititFormat <= "0000001000000000";
	u0: TwosComplementOfANumber port map( Ain=>Ain, Aout=>TwosComplementOfAin );
	u1: CarryLookAhead16bit port map ( a=>TwosComplementOfAin, b=>TwoInFixedDititFormat, cin=>'0', sum=>Aout );

end Behavioral;

