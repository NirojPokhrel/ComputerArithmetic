----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:54:36 12/06/2015 
-- Design Name: 
-- Module Name:    CarryLookAhead16bit - Behavioral 
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

entity CarryLookAhead16bit is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (15 downto 0);
			  cout: out STD_LOGIC);
end CarryLookAhead16bit;

architecture Behavioral of CarryLookAhead16bit is

	signal gen_logic, prop_logic: STD_LOGIC_VECTOR( 15 downto 0);
	signal carry_ahead: STD_LOGIC_VECTOR( 16 downto 0);
begin

	
	carry_ahead(0) <= cin;
	LOOP_BACK:
		for i in 0 to 15 generate
			gen_logic(i) <= a(i) and b(i);
			prop_logic(i) <= a(i) xor b(i);
			carry_ahead(i+1) <= gen_logic(i) or (prop_logic(i) and carry_ahead(i));
			sum(i) <= prop_logic(i) xor carry_ahead(i);
		end generate LOOP_BACK;
		cout <= carry_ahead(16);

end Behavioral;

