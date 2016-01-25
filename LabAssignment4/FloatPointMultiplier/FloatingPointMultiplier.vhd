----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:01:50 01/25/2016 
-- Design Name: 
-- Module Name:    FloatingPointMultiplier - Behavioral 
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

entity FloatingPointMultiplier is
    Port ( Ain : in  STD_LOGIC_VECTOR (22 downto 0);
			  Bin : in  STD_LOGIC_VECTOR (22 downto 0);
			  Overflow_flag: out STD_LOGIC;
			  Underflow_flag: out STD_LOGIC;
			  Sign_flag: out STD_LOGIC;
			  Zero_flag: out STD_LOGIC;
           Aout : out  STD_LOGIC_VECTOR (22 downto 0));
end FloatingPointMultiplier;

architecture Behavioral of FloatingPointMultiplier is

component SignificantMultiplication is
    Port ( Ain : in  STD_LOGIC_VECTOR (13 downto 0);
           Bin : in  STD_LOGIC_VECTOR (13 downto 0);
           Product : out  STD_LOGIC_VECTOR (29 downto 0));
end component;

component ExponentAddition is
    Port ( Ain : in  STD_LOGIC_VECTOR (7 downto 0);
           Bin : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
			  Overflow_flag: out STD_LOGIC;
			  Underflow_flag: out STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end component;

component NormalizationAndRounding is
    Port ( Ain : in  STD_LOGIC_VECTOR (29 downto 0);
           SignificantOut : out  STD_LOGIC_VECTOR (13 downto 0);
           IncExp : out  STD_LOGIC);
end component;

component CheckZero_14bit is
    Port ( Ain : in  STD_LOGIC_VECTOR (13 downto 0);
           IsZero : out  STD_LOGIC);
end component;

component CheckZero_8bit is
    Port ( Ain : in  STD_LOGIC_VECTOR (7 downto 0);
           IsZero : out  STD_LOGIC);
end component;

signal AinExpZero, AinSigZero, BinExpZero, BinSigZero, IncExp, Underflow_temp, Overflow_temp: STD_LOGIC;
signal ProductTemp: STD_LOGIC_VECTOR( 29 downto 0);
signal AoutTemp: STD_LOGIC_VECTOR( 22 downto 0);

begin
	--Check if they are both zero
	u0: CheckZero_8bit port map( Ain=>Ain(21 downto 14), IsZero=>AinExpZero );
	u1: CheckZero_14bit port map( Ain=>Ain(13 downto 0), IsZero=>AinSigZero );
	u2: CheckZero_8bit port map( Ain=>Bin(21 downto 14), IsZero=>BinExpZero );
	u3: CheckZero_14bit port map( Ain=>Bin(13 downto 0), IsZero=>BinSigZero );
	
	u4: SignificantMultiplication port map(Ain=>Ain(13 downto 0), Bin=>Bin(13 downto 0), Product=>ProductTemp );	
	u5: NormalizationAndRounding port map(Ain=>ProductTemp, SignificantOut=>AoutTemp(13 downto 0), IncExp=>IncExp );
	u6: ExponentAddition port map( Ain=>Ain(21 downto 14), Bin=>Bin(21 downto 14), Cin=>IncExp, 
			Overflow_flag=>Overflow_temp, Underflow_flag=>Underflow_temp, Sum => AoutTemp(21 downto 14));
	AoutTemp(22) <= Ain(22) xor Bin(22);
	
	process(AinExpZero, AinSigZero, BinExpZero, BinSigZero, AoutTemp )
		begin
		if (AinExpZero = '1' and AinSigZero = '1') or (BinExpZero = '1' and BinSigZero = '1' ) then
			Aout <= (others=>'0');
			Overflow_flag <= '0';
			Underflow_flag <= '0';
			Sign_flag <= '0';
			Zero_flag <= '1';
		else
			Aout <= AoutTemp;
			Overflow_flag <= Overflow_temp;
			Underflow_flag <= Underflow_temp;
			Sign_flag <= AoutTemp(22);
			Zero_flag <= '0';
		end if;		
	end process;

end Behavioral;

