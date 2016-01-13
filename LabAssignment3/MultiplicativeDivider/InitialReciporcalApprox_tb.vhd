--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:55:33 12/21/2015
-- Design Name:   
-- Module Name:   D:/ComputerArithmeticAssignment/LabAssignment3/MultiplicativeDivider/InitialReciporcalApprox_tb.vhd
-- Project Name:  MultiplicativeDivider
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: InitialReciporcalApprox
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
 
ENTITY InitialReciporcalApprox_tb IS
END InitialReciporcalApprox_tb;
 
ARCHITECTURE behavior OF InitialReciporcalApprox_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InitialReciporcalApprox
    PORT(
         Ain : IN  std_logic_vector(15 downto 0);
         Aout : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ain : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Aout : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InitialReciporcalApprox PORT MAP (
          Ain => Ain,
          Aout => Aout
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			Ain <= "0000011100000000";
      -- insert stimulus here 

      wait;
   end process;

END;
