----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:08:32 01/24/2016 
-- Design Name: 
-- Module Name:    ExponentAddition - Behavioral 
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

entity ExponentAddition is
    Port ( Ain : in  STD_LOGIC_VECTOR (7 downto 0);
           Bin : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
			  Overflow_flag: out STD_LOGIC;
			  Underflow_flag: out STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end ExponentAddition;

architecture Behavioral of ExponentAddition is
	
component ConditionalSum8Bit is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (7 downto 0);
           cout : out  STD_LOGIC);
end component;

	signal ExponentBias, sum_temp, ones_complement, sum_out: STD_LOGIC_VECTOR (7 downto 0);
	signal cout_temp, Cout: STD_LOGIC;
begin
	
	u0: ConditionalSum8Bit port map( a=>Ain, b=>Bin, cin=>Cin, sum=>sum_temp, cout=>Cout );
	--Now we need to subtract 127 from the addition. However, it can be done by subtracting 127 to the above sum result
	ones_complement <= "10000000"; --1's complement for 127 (01111111), cin=>"1" to make 2's complement
	u1: ConditionalSum8Bit port map( a=>sum_temp, b=>ones_complement, cin=>'1', sum=>sum_out, cout=>cout_temp );
	Sum <= sum_out;
	
	process( Ain, Bin, sum_out )
	begin
		if Ain(7) = '1' and Bin(7) = '1' and sum_out(7) = '0' then
			Overflow_flag <= '1';
			Underflow_flag <= '0';
		elsif Ain(7) = '0' and Bin(7) = '0' and sum_out(7) = '1' then
			Overflow_flag <= '0';
			Underflow_flag <='1';
		else
			Overflow_flag <= '0';
			Underflow_flag <='0';
		end if;
	end process;
end Behavioral;

