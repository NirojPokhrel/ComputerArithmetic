----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:38:25 12/03/2015 
-- Design Name: 
-- Module Name:    MovingAverageFilter - Behavioral 
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
use WORK.TYPEDECLARATION.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MovingAverageFilter is
    Port ( Ain : in  STD_LOGIC_VECTOR (10 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Qout : out  STD_LOGIC_VECTOR (10 downto 0));
end MovingAverageFilter;

architecture Behavioral of MovingAverageFilter is

component CarrySaveAdder_11bits is
    Port ( a : in  STD_LOGIC_VECTOR (10 downto 0);
           b : in  STD_LOGIC_VECTOR (10 downto 0);
           c : in  STD_LOGIC_VECTOR (10 downto 0);
           d : in  STD_LOGIC_VECTOR (10 downto 0);
           sum : out  STD_LOGIC_VECTOR (14 downto 0);
           cout : out  STD_LOGIC_VECTOR (14 downto 0));
end component;

component CarrySaveAdder_16bits is
    Port ( a : in  STD_LOGIC_VECTOR (14 downto 0);
           b : in  STD_LOGIC_VECTOR (14 downto 0);
           c : in  STD_LOGIC_VECTOR (14 downto 0);
           d : in  STD_LOGIC_VECTOR (14 downto 0);
           sum : out  STD_LOGIC_VECTOR (14 downto 0);
           cout : out  STD_LOGIC_VECTOR (14 downto 0));
end component;

component RegisterArray_16 is
    Port ( a : in  STD_LOGIC_VECTOR (10 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : inout  reg_buff);
end component;

component CarryLookAhead16bit is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (15 downto 0);
           cout : out  STD_LOGIC);
end component;

signal q : reg_buff;
signal sum1, sum2, sum3, sum4, cout1, cout2, cout3, cout4: STD_LOGIC_VECTOR( 14 downto 0 );
signal cout1_sl, cout2_sl, cout3_sl, cout4_sl: STD_LOGIC_VECTOR( 14 downto 0 );
signal sum11, cout11, sum12, cout12: STD_LOGIC_VECTOR( 14 downto 0 );
signal cout11_sl, cout12_sl: STD_LOGIC_VECTOR( 14 downto 0 );
signal sum111, cout111: STD_LOGIC_VECTOR( 14 downto 0 );
signal total_sum, sum_out, cout_out: STD_LOGIC_VECTOR(15 downto 0);
signal cout_temp:STD_LOGIC;

begin

	u1: RegisterArray_16 port map( a=>Ain, clk=>clk, rst=>rst, q=>q );
	u2: CarrySaveAdder_11bits port map( a=>q(0), b=>q(1), c=>q(2), d=>q(3),
					sum=>sum1, cout=>cout1 );
	u3: CarrySaveAdder_11bits port map( a=>q(4), b=>q(5), c=>q(6), d=>q(7),
					sum=>sum2, cout=>cout2 );
	u4: CarrySaveAdder_11bits port map( a=>q(8), b=>q(9), c=>q(10), d=>q(11),
					sum=>sum3, cout=>cout3 );
	u5: CarrySaveAdder_11bits port map( a=>q(12), b=>q(13), c=>q(14), d=>q(15),
					sum=>sum4, cout=>cout4 );
	cout1_sl <= cout1(13 downto 0) & '0';
	cout2_sl <= cout2(13 downto 0) & '0';
	cout3_sl <= cout3(13 downto 0) & '0';
	cout4_sl <= cout4(13 downto 0) & '0';
	
	u6: CarrySaveAdder_16bits port map( a=>sum1, b=>cout1_sl, c=>sum2, d=>cout2_sl,
					sum=>sum11, cout=>cout11 );
	u7: CarrySaveAdder_16bits port map( a=>sum3, b=>cout3_sl, c=>sum4, d=>cout4_sl,
					sum=>sum12, cout=>cout12 );
	
	cout11_sl <= cout11(13 downto 0) & '0';
	cout12_sl <= cout12(13 downto 0) & '0';
	u8: CarrySaveAdder_16bits port map( a=>sum11, b=>cout11_sl, c=>sum12, d=>cout12_sl,
					sum=>sum111, cout=>cout111 );
	cout_out <= '0' & cout111( 13 downto 0) & '0';
	sum_out <= '0' & sum111;
	u9: CarryLookAhead16bit port map( a=>sum_out, b=>cout_out, cin=>'0', sum=>total_sum, cout=>cout_temp);
	Qout <= total_sum(14 downto 4); --divide by 16 and only first 15 bits are useful last bit is not used.

end Behavioral;

