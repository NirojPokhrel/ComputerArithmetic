----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:07:17 12/20/2015 
-- Design Name: 
-- Module Name:    TwosComplementOfANumber - Behavioral 
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

entity TwosComplementOfANumber is
    Port ( Ain : in  STD_LOGIC_VECTOR (15 downto 0);
           Aout : out  STD_LOGIC_VECTOR (15 downto 0));
end TwosComplementOfANumber;

architecture Behavioral of TwosComplementOfANumber is

signal temp, add_one: STD_LOGIC_VECTOR( 15 downto 0);

component CarryLookAhead16bit is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (15 downto 0);
			  cout: out STD_LOGIC);
end component;

begin

	temp <= Ain xor ("1111111111111111");
	add_one <= "0000000000000001";
	
	u1: CarryLookAhead16bit port map( a=>temp, b=>add_one, cin=>'0', sum=>Aout );
end Behavioral;

