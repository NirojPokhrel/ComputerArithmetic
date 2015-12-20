--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:14:05 12/20/2015
-- Design Name:   
-- Module Name:   D:/ComputerArithmeticAssignment/LabAssignment3/MultiplicativeDivider/PartialProductGenerator_tb.vhd
-- Project Name:  MultiplicativeDivider
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PartialProductGenerator
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
 
ENTITY PartialProductGenerator_tb IS
END PartialProductGenerator_tb;
 
ARCHITECTURE behavior OF PartialProductGenerator_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PartialProductGenerator
    PORT(
         Ain : IN  std_logic_vector(15 downto 0);
         Sel : IN  std_logic_vector(2 downto 0);
         Pproduct : OUT  std_logic_vector(16 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ain : std_logic_vector(15 downto 0) := (others => '0');
   signal Sel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal Pproduct : std_logic_vector(16 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PartialProductGenerator PORT MAP (
          Ain => Ain,
          Sel => Sel,
          Pproduct => Pproduct
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Ain <= "0000000000001111";
		Sel <= "111";

      -- insert stimulus here 

      wait;
   end process;

END;
