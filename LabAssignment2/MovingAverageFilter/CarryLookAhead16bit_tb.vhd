--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:24:26 12/07/2015
-- Design Name:   
-- Module Name:   D:/ComputerArithmeticAssignment/LabAssignment2/MovingAverageFilter/CarryLookAhead16bit_tb.vhd
-- Project Name:  MovingAverageFilter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CarryLookAhead16bit
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
 
ENTITY CarryLookAhead16bit_tb IS
END CarryLookAhead16bit_tb;
 
ARCHITECTURE behavior OF CarryLookAhead16bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CarryLookAhead16bit
    PORT(
         a : IN  std_logic_vector(15 downto 0);
         b : IN  std_logic_vector(15 downto 0);
         cin : IN  std_logic;
         sum : OUT  std_logic_vector(15 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(15 downto 0) := (others => '0');
   signal b : std_logic_vector(15 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal sum : std_logic_vector(15 downto 0);
   signal cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CarryLookAhead16bit PORT MAP (
          a => a,
          b => b,
          cin => cin,
          sum => sum,
          cout => cout
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			a <= "1010101010101010";
			b <= "0101010101010101";
			cin <= '1';
      wait;
   end process;

END;
