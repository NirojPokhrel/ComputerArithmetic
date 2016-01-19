----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:44:43 12/21/2015 
-- Design Name: 
-- Module Name:    InitialReciporcalApprox - Behavioral 
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

entity InitialReciporcalApprox is
    Port ( Ain : in  STD_LOGIC_VECTOR (15 downto 0);
           Aout : out  STD_LOGIC_VECTOR (15 downto 0));
end InitialReciporcalApprox;

architecture Behavioral of InitialReciporcalApprox is

begin

	process(Ain)
	begin
	Aout <= (others =>'0');
		FOR_LOOP:
		for i in 15 downto 8 loop
			if Ain(i) = '1' then
				Aout(15-i) <= '1';
				exit FOR_LOOP; 
			end if;
		end loop;
	end process;
	

end Behavioral;

