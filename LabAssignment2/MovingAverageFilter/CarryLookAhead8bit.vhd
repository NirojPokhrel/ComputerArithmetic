----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:44:19 11/02/2015 
-- Design Name: 
-- Module Name:    CarryLookAhead8bit - Behavioral 
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

entity CarryLookAhead8bit is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (7 downto 0);
           cout : out  STD_LOGIC);
end CarryLookAhead8bit;

architecture Behavioral of CarryLookAhead8bit is


component FullAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end component;

	signal carry_ahead: STD_LOGIC_VECTOR( 7 downto 0);

begin

	carry_ahead(0) <= (a(0) and b(0)) or 
							( (a(0) xor b(0) ) and cin);
	carry_ahead(1) <= (a(1) and b(1)) or 
							( (a(1) xor b(1) ) and (a(0) and b(0) )) or 
							( (a(0) xor b(0)) and (a(1) xor b(1)) and cin);
	carry_ahead(2) <= (a(2) and b(2)) or 
							( (a(2) xor b(2) ) and (a(1) and b(1))) or 
							( (a(2) xor b(2)) and (a(1) xor b(1)) and (a(0) and b(0))) or
							( (a(2) xor b(2)) and (a(1) xor b(1)) and (a(0) xor b(0)) and cin);
	carry_ahead(3) <= (a(3) and b(3)) or
							((a(3) xor b(3)) and ( a(2) and b(2))) or
							((a(3)xor b(3))and(a(2)xor b(2))and(a(1)and b(1))) or
							((a(3)xor b(3))and(a(2)xor b(2))and(a(1) xor b(1))and(a(0) and b(0))) or
							((a(3)xor b(3))and(a(2)xor b(2))and(a(1)xor b(1))and(a(0)xor b(0)) and cin);
	carry_ahead(4) <= (a(4) and b(4)) or
							((a(4)xor b(4)) and (a(3) and b(3))) or
							((a(4)xor b(4)) and (a(3) xor b(3)) and ( a(2) and b(2))) or
							((a(4)xor b(4)) and (a(3)xor b(3))and(a(2)xor b(2))and(a(1)and b(1))) or
							((a(4)xor b(4)) and (a(3)xor b(3))and(a(2)xor b(2))and(a(1) xor b(1))and(a(0) and b(0))) or
							((a(4)xor b(4)) and (a(3)xor b(3))and(a(2)xor b(2))and(a(1)xor b(1))and(a(0)xor b(0)) and cin);
	carry_ahead(5) <= (a(5) and b(5)) or
							((a(5) xor b(5)) and (a(4) and b(4))) or
							((a(5) xor b(5)) and (a(4)xor b(4)) and (a(3) and b(3))) or
							((a(5) xor b(5)) and (a(4)xor b(4)) and (a(3) xor b(3)) and ( a(2) and b(2))) or
							((a(5) xor b(5)) and (a(4)xor b(4)) and (a(3)xor b(3))and(a(2)xor b(2))and(a(1)and b(1))) or
							((a(5) xor b(5)) and (a(4)xor b(4)) and (a(3)xor b(3))and(a(2)xor b(2))and(a(1) xor b(1))and(a(0) and b(0))) or
							((a(5) xor b(5)) and ((a(4)xor b(4)) and (a(3)xor b(3))and(a(2)xor b(2))and(a(1)xor b(1))and(a(0)xor b(0))) and cin);
	carry_ahead(6) <= (a(6) and b(6)) or
							((a(6) xor b(6)) and ( a(5) and b(5))) or
							((a(6) xor b(6)) and (a(5) xor b(5)) and (a(4) and b(4))) or
							((a(6) xor b(6)) and (a(5) xor b(5)) and (a(4)xor b(4)) and (a(3) and b(3))) or
							((a(6) xor b(6)) and (a(5) xor b(5)) and (a(4)xor b(4)) and (a(3) xor b(3)) and ( a(2) and b(2))) or
							((a(6) xor b(6)) and (a(5) xor b(5)) and (a(4)xor b(4)) and (a(3)xor b(3))and(a(2)xor b(2))and(a(1)and b(1))) or
							((a(6) xor b(6)) and (a(5) xor b(5)) and (a(4)xor b(4)) and (a(3)xor b(3))and(a(2)xor b(2))and(a(1) xor b(1))and(a(0) and b(0))) or
							((a(6) xor b(6)) and (a(5) xor b(5)) and ((a(4)xor b(4)) and (a(3)xor b(3))and(a(2)xor b(2))and(a(1)xor b(1))and(a(0)xor b(0))) and cin);
	
	
	carry_ahead(7) <= (a(7) and b(7)) or
							((a(7) xor b(7)) and (a(6) and b(6)))  or
							((a(7) xor b(7)) and (a(6) xor b(6)) and ( a(5) and b(5)) ) or
							((a(7) xor b(7)) and (a(6) xor b(6)) and (a(5) xor b(5)) and (a(4) and b(4))) or
							((a(7) xor b(7)) and (a(6) xor b(6)) and (a(5) xor b(5)) and (a(4)xor b(4)) and (a(3) and b(3))) or
							((a(7) xor b(7)) and (a(6) xor b(6)) and (a(5) xor b(5)) and (a(4)xor b(4)) and (a(3) xor b(3)) and ( a(2) and b(2))) or
							((a(7) xor b(7)) and (a(6) xor b(6)) and (a(5) xor b(5)) and (a(4)xor b(4)) and (a(3)xor b(3))and(a(2)xor b(2))and(a(1)and b(1))) or
							((a(7) xor b(7)) and (a(6) xor b(6)) and (a(5) xor b(5)) and (a(4)xor b(4)) and (a(3)xor b(3))and(a(2)xor b(2))and(a(1) xor b(1))and(a(0) and b(0))) or
							((a(7) xor b(7)) and (a(6) xor b(6)) and (a(5) xor b(5)) and ((a(4)xor b(4)) and (a(3)xor b(3))and(a(2)xor b(2))and(a(1)xor b(1))and(a(0)xor b(0))) and cin);
	
	u1: FullAdder port map( a=>a(0), b=>b(0), cin => carry_ahead(0), sum => sum(0) );
	u2: FullAdder port map( a=>a(1), b=>b(1), cin=> carry_ahead(1), sum=>sum(1) );
	u3: FullAdder port map( a=>a(2), b=>b(2), cin => carry_ahead(2), sum => sum(2) );
	u4: FullAdder port map( a=>a(3), b=>b(3), cin=> carry_ahead(3), sum=>sum(3));
	u5: FullAdder port map( a=>a(4), b=>b(4), cin => carry_ahead(4), sum => sum(4) );
	u6: FullAdder port map( a=>a(5), b=>b(5), cin=> carry_ahead(5), sum=>sum(5) );
	u7: FullAdder port map( a=>a(6), b=>b(6), cin => carry_ahead(6), sum => sum(6) );
	u8: FullAdder port map( a=>a(7), b=>b(7), cin=> carry_ahead(7), sum=>sum(7), cout=>cout );


end Behavioral;

