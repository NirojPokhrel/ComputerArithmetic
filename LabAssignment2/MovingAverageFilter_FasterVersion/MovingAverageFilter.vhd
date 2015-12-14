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

component RegisterArray_16 is
    Port ( a : in  STD_LOGIC_VECTOR (14 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : inout  reg_buff);
end component;

component CarryLookAhead16bit is
    Port ( a : in  STD_LOGIC_VECTOR (14 downto 0);
           b : in  STD_LOGIC_VECTOR (14 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (14 downto 0));
end component;

component Register_11bit is
    Port ( din : in  STD_LOGIC_VECTOR (14 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (14 downto 0));
end component;
signal q : reg_buff;
signal ain_extended, prev_sum, out_complement: STD_LOGIC_VECTOR( 14 downto 0 );
signal a1_temp, b2_temp, sum_1, sum_2, sum_out : STD_LOGIC_VECTOR( 14 downto 0);


begin	
	ain_extended <= ("1111" & Ain ) when Ain(10) = '1' else
		  ("0000" & Ain );
	u1: RegisterArray_16 port map( a=>ain_extended, clk=>clk, rst=>rst, q=>q );
	a1_temp <= q(0);
	u2: CarryLookAhead16bit port map( a=>a1_temp, b=>prev_sum, cin=>'0', sum=>sum_1);
	out_complement <= not q(16);
	b2_temp <= (others=>'0');
	u3: CarryLookAhead16bit port map( a=>out_complement, b=>b2_temp, cin=>'1', sum=>sum_2);
	u4: CarryLookAhead16bit port map( a=>sum_1, b=>sum_2, cin=>'0', sum=>sum_out);
	u5: Register_11bit port map ( din=>sum_out, clk=>clk, rst=>rst, q=>prev_sum );
	Qout <= sum_out( 14 downto 4);
	

end Behavioral;

