----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:42:40 11/04/2015 
-- Design Name: 
-- Module Name:    ConditionalSum4bit - Behavioral 
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

entity ConditionalSum4bit is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           sum_out_zero : out  STD_LOGIC_VECTOR (3 downto 0);
           sum_out_one : out  STD_LOGIC_VECTOR (3 downto 0);
           cout_zero : out  STD_LOGIC;
           cout_one : out  STD_LOGIC);
end ConditionalSum4bit;

architecture Behavioral of ConditionalSum4bit is

component ConditionalSum2bit is
    Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           b : in  STD_LOGIC_VECTOR (1 downto 0);
           sum_out_zero : out  STD_LOGIC_VECTOR (1 downto 0);
           sum_out_one : out  STD_LOGIC_VECTOR (1 downto 0);
           cout_zero : out  STD_LOGIC;
           cout_one : out  STD_LOGIC);
end component;

signal sum_zero, sum_one: STD_LOGIC_VECTOR( 1 downto 0);
signal carry_zero_gen, carry_one_gen: STD_LOGIC_VECTOR(1 downto 0);

begin
	u1: ConditionalSum2bit port map( a=>a(1 downto 0), b=>b(1 downto 0), sum_out_zero=>sum_out_zero(1 downto 0),
		sum_out_one=>sum_out_one(1 downto 0), cout_zero=>carry_zero_gen(0), cout_one=>carry_one_gen(0));
		
	u2: ConditionalSum2bit port map( a=>a(3 downto 2), b=>b( 3 downto 2), sum_out_zero=>sum_zero,
		sum_out_one=>sum_one, cout_zero=>carry_zero_gen(1), cout_one=>carry_one_gen(1));
	
	process( sum_zero, sum_one,carry_zero_gen, carry_one_gen )
	begin
	if( carry_zero_gen(0) = '0' ) then
		sum_out_zero( 3 downto 2) <= sum_zero;
		cout_zero <= carry_zero_gen(1);
	else
		sum_out_zero( 3 downto 2) <= sum_one;
		cout_zero <= carry_one_gen(1);
	end if;
	if( carry_one_gen(0) = '0' ) then
		sum_out_one( 3 downto 2) <= sum_zero;
		cout_one <= carry_zero_gen(1);
	else
		sum_out_one( 3 downto 2) <= sum_one;
		cout_one <= carry_one_gen(1);
	end if;
end process;

end Behavioral;

