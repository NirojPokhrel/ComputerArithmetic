----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:35:33 12/22/2015 
-- Design Name: 
-- Module Name:    Divider16bit - Behavioral 
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
--
--GoldSchmidt Algorithm
--Require: e0 <1
--1: Initialize N-1<-A,D-1<-B,F-1< (1 - e0 )/ B
--2: for i ? 0 to k do
--3: Ni ? Ni-1 * Fi-1
--4: Di ? Di-1 * Fi-1
--5: Fi ? 2 - Di
--6: end for
--7: Return (N)

entity Divider16bit is
    Port ( Ain : in  STD_LOGIC_VECTOR (15 downto 0);
           Bin : in  STD_LOGIC_VECTOR (15 downto 0);
           Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           Quotient : out  STD_LOGIC_VECTOR (15 downto 0));
end Divider16bit;

architecture Behavioral of Divider16bit is

component DividerControl is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           LoadInput : out  STD_LOGIC;
			  UpdateOutput: out STD_LOGIC;
			  IterateCycle: out STD_LOGIC);
end component;

component InitialReciporcalApprox is
    Port ( Ain : in  STD_LOGIC_VECTOR (15 downto 0);
           Aout : out  STD_LOGIC_VECTOR (15 downto 0));
end component;


component BoothMultiplier16bit is
    Port ( Ain : in  STD_LOGIC_VECTOR (15 downto 0);
           Bin : in  STD_LOGIC_VECTOR (15 downto 0);
           Product : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component SubtractFromTwo is
    Port ( Ain : in  STD_LOGIC_VECTOR (15 downto 0);
           Aout : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

signal Ni, Di, Fi, Fi_temp, Fi_temp2 : STD_LOGIC_VECTOR( 15 downto 0 );
signal LoadInput, UpdateOutput, IterateCycle: STD_LOGIC;
signal Ni_next, Di_next, Fi_next: STD_LOGIC_VECTOR( 15 downto 0 );
signal Product_Ni, Product_Di: STD_LOGIC_VECTOR( 31 downto 0 );

begin

	u0: DividerControl port map( Clk=>Clk, Rst=>Rst, LoadInput=>LoadInput, UpdateOutput=>UpdateOutput,
											IterateCycle=>IterateCycle);
	u1: InitialReciporcalApprox port map( Ain=>Bin, Aout=>Fi_temp );
	u2: BoothMultiplier16bit port map( Ain=>Ni, Bin=>Fi, Product=>Product_Ni );
	u3: BoothMultiplier16bit port map( Ain=>Di, Bin=>Fi, Product=>Product_Di );
	Ni_next <= Product_Ni( 23 downto 8);
	Di_next <= Product_Di( 23 downto 8);
	u4: SubtractFromTwo port map( Ain=>Di_next, Aout=>Fi_next );
	
	LOAD_INPUT:										
	process(Clk)
	begin
		if Clk'event and Clk = '1' then
			if LoadInput = '1' then
				Ni <= Ain;
				Di <= Bin;
				Fi <= Fi_temp;
			else
				Ni <= Ni_next;
				Di <= Di_next;
				Fi <= Fi_next;
			end if;
		end if;
	end process;
	
	UPDATE_OUTPUT:
	process(Clk)
	begin
		if Clk'event and Clk = '1' then
			if UpdateOutput = '1' then
				Quotient <= Ni_next;
			else
				Quotient <= (others=>'0');
			end if;
		end if;
	end process;
end Behavioral;

