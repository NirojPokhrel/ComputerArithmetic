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


--signal carry_propagate:STD_LOGIC_VECTOR( 7 downto 0);
--signal carry_generate:STD_LOGIC_VECTOR( 7 downto 0);
--signal internal_carry:STD_LOGIC_VECTOR( 7 downto 0);
signal temp: STD_LOGIC_VECTOR( 7 downto 0 );

begin

	--carry_generate <= a and b;
	--carry_propagate <= a xor b;
	--process( carry_generate, carry_propagate, internal_carry, cin) 
	--begin
	--	internal_carry(1) <= carry_generate(0) or ( carry_propagate(0) and cin );
	--	for i in 1 to 6 loop
	--		internal_carry(i+1) <= carry_generate(i) or ( carry_propagate(0) and internal_carry(i));
	--	end loop;
	--	cout <= carry_generate(7) or ( carry_propagate(7) and internal_carry(7));
	--end process;
	
	--sum (0) <= carry_propagate(0) xor cin;
	--sum(7 downto 1) <= carry_propagate(7 downto 1) xor internal_carry( 7 downto 1);


	u1: FullAdder port map( a=>a(0), b=>b(0), cin=>cin, sum=>sum(0), cout=>temp(0));
	u2: FullAdder port map( a=>a(1), b=>b(1), cin=>temp(0), sum=>sum(1), cout=>temp(1));
	u3: FullAdder port map( a=>a(2), b=>b(2), cin=>temp(1), sum=>sum(2), cout=>temp(2));
	u4: FullAdder port map( a=>a(3), b=>b(3), cin=>temp(2), sum=>sum(3), cout=>temp(3));
	u5: FullAdder port map( a=>a(4), b=>b(4), cin=>temp(3), sum=>sum(4), cout=>temp(4));
	u6: FullAdder port map( a=>a(5), b=>b(5), cin=>temp(4), sum=>sum(5), cout=>temp(5));
	u7: FullAdder port map( a=>a(6), b=>b(6), cin=>temp(5), sum=>sum(6), cout=>temp(6));
	u8: FullAdder port map( a=>a(7), b=>b(7), cin=>temp(6), sum=>sum(7), cout=>cout);
end Behavioral;

