--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:20:18 01/24/2016
-- Design Name:   
-- Module Name:   D:/ComputerArithmeticAssignment/LabAssignment4/FloatPointMultiplier/ExponentAddition_tb.vhd
-- Project Name:  FloatPointMultiplier
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ExponentAddition
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ExponentAddition_tb IS
END ExponentAddition_tb;
 
ARCHITECTURE behavior OF ExponentAddition_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ExponentAddition
    PORT(
         Ain : IN  std_logic_vector(7 downto 0);
         Bin : IN  std_logic_vector(7 downto 0);
         Cin : IN  std_logic;
         Sum : OUT  std_logic_vector(7 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    


   --Inputs
   signal Ain : std_logic_vector(7 downto 0) := (others => '0');
   signal Bin : std_logic_vector(7 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Sum : std_logic_vector(7 downto 0);
	signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ExponentAddition PORT MAP (
          Ain => Ain,
          Bin => Bin,
          Cin => Cin,
          Sum => Sum,
          Cout => Cout
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			Ain <= "10010110";
			Bin <= "01100100";
			Cin <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
