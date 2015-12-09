--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:32:54 11/25/2015
-- Design Name:   
-- Module Name:   D:/ComputerArithmeticAssignment/LabAssignment2/MovingAverageFilter/test_testbench_signextension.vhd
-- Project Name:  MovingAverageFilter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SignExtensionTo14Bit
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
 
ENTITY test_testbench_signextension IS
END test_testbench_signextension;
 
ARCHITECTURE behavior OF test_testbench_signextension IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SignExtensionTo14Bit
    PORT(
         a : IN  std_logic_vector(10 downto 0);
         b : OUT  std_logic_vector(14 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(10 downto 0) := (others => '0');

 	--Outputs
   signal b : std_logic_vector(14 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SignExtensionTo14Bit PORT MAP (
          a => a,
          b => b
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			a<="01000000110";

      -- insert stimulus here 


      wait;
   end process;

END;
