----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:08:25 12/02/2015 
-- Design Name: 
-- Module Name:    RegisterArray_16 - Behavioral 
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

entity RegisterArray_16 is
    Port ( a : in  STD_LOGIC_VECTOR (10 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : inout  reg_buff);
end RegisterArray_16;

architecture Behavioral of RegisterArray_16 is

component Register_11bit is
    Port ( din : in  STD_LOGIC_VECTOR (10 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (10 downto 0));
end component;

signal intermediate_q : reg_buff;
begin

	u1: Register_11bit port map ( din=>a, clk=>clk, rst=>rst, q=>q(0) );
	BUFF_BLOCK:
		for i in 0 to 14 generate
			u2: Register_11bit port map( din=>q(i), clk=>clk, rst=>rst, q=>q(i+1)  );
		end generate BUFF_BLOCK;


end Behavioral;

