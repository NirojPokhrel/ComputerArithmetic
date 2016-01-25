----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:22:37 11/05/2015 
-- Design Name: 
-- Module Name:    ConditionalSum2Bit - Behavioral 
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

entity ConditionalSum2Bit is
    Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           b : in  STD_LOGIC_VECTOR (1 downto 0);
           sum_out_zero : out  STD_LOGIC_VECTOR (1 downto 0);
           sum_out_one : out  STD_LOGIC_VECTOR (1 downto 0);
           cout_zero : out  STD_LOGIC;
           cout_one : out  STD_LOGIC);
end ConditionalSum2Bit;

architecture Behavioral of ConditionalSum2Bit is

component FullAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end component;

signal carry_zero, carry_one: STD_LOGIC_VECTOR( 1 downto 0);
signal sum_zero, sum_one: STD_LOGIC;

begin

	u1: FullAdder port map( a=>a(0), b=>b(0), cin=>'0', sum=>sum_out_zero(0), cout=>carry_zero(0) );
	u2: FullAdder port map( a=>a(0), b=>b(0), cin=>'1', sum=>sum_out_one(0), cout=>carry_one(0) );


	u3: FullAdder port map( a=>a(1), b=>b(1), cin=>'0', sum=>sum_zero, cout=>carry_zero(1) );
	u4: FullAdder port map( a=>a(1), b=>b(1), cin=>'1', sum=>sum_one, cout=>carry_one(1) );
	
	process( sum_zero, sum_one, carry_zero, carry_one )
	begin
		if( carry_zero(0) = '0' ) then
			sum_out_zero(1) <= sum_zero;
			cout_zero <= carry_zero(1);
		else
			sum_out_zero(1) <= sum_one;
			cout_zero <= carry_one(1);
		end if;
		if( carry_one(0) = '0' ) then
			sum_out_one(1) <= sum_zero;
			cout_one <= carry_zero(1);
		else
			sum_out_one(1) <= sum_one;
			cout_one <= carry_one(1);
		end if;
	end process;
end Behavioral;

