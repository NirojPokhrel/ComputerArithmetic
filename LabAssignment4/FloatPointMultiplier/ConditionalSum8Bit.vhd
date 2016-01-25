----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:14:09 11/05/2015 
-- Design Name: 
-- Module Name:    ConditionalSum8Bit - Behavioral 
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

entity ConditionalSum8Bit is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (7 downto 0);
           cout : out  STD_LOGIC);
end ConditionalSum8Bit;
architecture Behavioral of ConditionalSum8Bit is


component ConditionalSum4Bit is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           sum_out_zero : out  STD_LOGIC_VECTOR (3 downto 0);
           sum_out_one : out  STD_LOGIC_VECTOR (3 downto 0);
           cout_zero : out  STD_LOGIC;
           cout_one : out  STD_LOGIC);
end component;

signal sum_zero, sum_one: STD_LOGIC_VECTOR( 7 downto 0 );
signal cout_zero_gen, cout_one_gen: STD_LOGIC_VECTOR(1 downto 0);

begin
	u1: ConditionalSum4Bit port map( a=>a(3 downto 0), b=>b(3 downto 0), sum_out_zero=>sum_zero(3 downto 0),
		sum_out_one=>sum_one(3 downto 0), cout_zero=>cout_zero_gen(0), cout_one=>cout_one_gen(0));
	u2: ConditionalSum4Bit port map( a=>a(7 downto 4), b=>b(7 downto 4), sum_out_zero=>sum_zero(7 downto 4),
		sum_out_one=>sum_one(7 downto 4), cout_zero=>cout_zero_gen(1), cout_one=>cout_one_gen(1));
												
	process( cout_zero_gen, cout_one_gen, sum_zero, sum_one, cin )
	begin
		if( cin = '0' ) then
			sum( 3 downto 0) <= sum_zero(3 downto 0);
			if( cout_zero_gen(0) = '0' ) then
				sum(7 downto 4) <= sum_zero(7 downto 4);
				cout <= cout_zero_gen(1);
			else
				sum(7 downto 4) <= sum_one(7 downto 4);
				cout <= cout_one_gen(1);
			end if;
		else
			sum( 3 downto 0) <= sum_one(3 downto 0);
			if( cout_one_gen(0) = '0' ) then
				sum(7 downto 4) <= sum_zero(7 downto 4);
				cout <= cout_zero_gen(1);
			else
				sum(7 downto 4) <= sum_one(7 downto 4);
				cout <= cout_one_gen(1);
			end if;
		end if;
				
	end process;
end Behavioral;

