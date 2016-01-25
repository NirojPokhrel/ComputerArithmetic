----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:06:33 12/20/2015 
-- Design Name: 
-- Module Name:    CarrySaveAdder_tree - Behavioral 
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

entity CarrySaveAdder_tree is
    Port ( PP0 : in  STD_LOGIC_VECTOR (16 downto 0);
           PP1 : in  STD_LOGIC_VECTOR (16 downto 0);
           PP2 : in  STD_LOGIC_VECTOR (16 downto 0);
           PP3 : in  STD_LOGIC_VECTOR (16 downto 0);
           PP4 : in  STD_LOGIC_VECTOR (16 downto 0);
           PP5 : in  STD_LOGIC_VECTOR (16 downto 0);
           PP6 : in  STD_LOGIC_VECTOR (16 downto 0);
           PP7 : in  STD_LOGIC_VECTOR (16 downto 0);
           Sum : out  STD_LOGIC_VECTOR (31 downto 0);
           Cout : out  STD_LOGIC_VECTOR (31 downto 0));
end CarrySaveAdder_tree;

architecture Behavioral of CarrySaveAdder_tree is

component CarrySaveAdder_32bits is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           c : in  STD_LOGIC_VECTOR (31 downto 0);
           d : in  STD_LOGIC_VECTOR (31 downto 0);
           sum : out  STD_LOGIC_VECTOR (31 downto 0);
           cout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal PP0e, PP1e, PP2e, PP3e, PP4e, PP5e, PP6e, PP7e: STD_LOGIC_VECTOR( 31 downto 0 );
signal sum_0, cout_0, sum_1, cout_1, count_0Shift, count_1Shift: STD_LOGIC_VECTOR( 31 downto 0);
signal Ones, Zeros: STD_LOGIC_VECTOR( 15 downto 0 );
begin
---- Sign extensions
	Ones <= "1111111111111111";
	Zeros <= "0000000000000000";
	PP0e <= (Zeros(15 downto 1) & PP0) when PP0(16) = '0' else
				(Ones(15 downto 1) & PP0);
	PP1e <= (Zeros(15 downto 3) & PP1 & "00") when PP1(16) = '0' else
				(Ones(15 downto 3) & PP1 & "00");
	PP2e <= (Zeros(15 downto 5) & PP2 & "0000") when PP2(16) = '0' else
				(Ones(15 downto 5) & PP2 & "0000");
	PP3e <= (Zeros(15 downto 7) & PP3 & "000000") when PP3(16) = '0' else
				(Ones(15 downto 7) & PP3 & "000000");
	PP4e <= (Zeros(15 downto 9) & PP4 & "00000000") when PP4(16) = '0' else
				(Ones(15 downto 9) & PP4 & "00000000");
	PP5e <= (Zeros(15 downto 11) & PP5 & "0000000000") when PP5(16) = '0' else
				(Ones(15 downto 11) & PP5 & "0000000000");
	PP6e <= (Zeros(15 downto 13) & PP6 & "000000000000") when PP6(16) = '0' else
				(Ones(15 downto 13) & PP6 & "000000000000");
	PP7e <= (Zeros(15 downto 15) & PP7 & "00000000000000") when PP7(16) = '0' else
				(Ones(15 downto 15) & PP7 & "00000000000000");
	
---- Carry Save addition
	u0: CarrySaveAdder_32bits port map( a=>PP0e, b=>PP1e, c=>PP2e, d=>PP3e, sum=>sum_0, cout=>cout_0);
	u1: CarrySaveAdder_32bits port map( a=>PP4e, b=>PP5e, c=>PP6e, d=>PP7e, sum=>sum_1, cout=>cout_1);
	
	count_0Shift <= cout_0(30 downto 0) & '0';
	count_1Shift <= cout_1(30 downto 0) & '0';

	u2: CarrySaveAdder_32bits port map( a=>sum_0, b=>sum_1, c=>count_0Shift, d=>count_1Shift, sum=>Sum, cout=>Cout);
---- 	
end Behavioral;

