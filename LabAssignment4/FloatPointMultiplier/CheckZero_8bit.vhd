----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:48:10 01/25/2016 
-- Design Name: 
-- Module Name:    CheckZero_8bit - Behavioral 
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

entity CheckZero_8bit is
    Port ( Ain : in  STD_LOGIC_VECTOR (7 downto 0);
           IsZero : out  STD_LOGIC);
end CheckZero_8bit;

architecture Behavioral of CheckZero_8bit is
signal flag: STD_LOGIC;
begin

	process(Ain)
	begin
		flag <= '1';
		LOOP_8bit:
		for i in 0 to 7 loop
			if Ain(i) = '1' then
				flag <= '0';
				exit LOOP_8bit;
			end if;
		end loop;
	end process;
	IsZero <= flag;
end Behavioral;

