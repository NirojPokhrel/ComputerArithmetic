--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:54:29 01/25/2016
-- Design Name:   
-- Module Name:   D:/ComputerArithmeticAssignment/LabAssignment4/FloatPointMultiplier/BoothMultiplier16bit_tb.vhd
-- Project Name:  FloatPointMultiplier
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BoothMultiplier16bit
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
 
ENTITY BoothMultiplier16bit_tb IS
END BoothMultiplier16bit_tb;
 
ARCHITECTURE behavior OF BoothMultiplier16bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BoothMultiplier16bit
    PORT(
         Ain : IN  std_logic_vector(15 downto 0);
         Bin : IN  std_logic_vector(15 downto 0);
         Product : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ain : std_logic_vector(15 downto 0) := (others => '0');
   signal Bin : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Product : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BoothMultiplier16bit PORT MAP (
          Ain => Ain,
          Bin => Bin,
          Product => Product
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


      -- insert stimulus here 

      wait;
   end process;

END;
