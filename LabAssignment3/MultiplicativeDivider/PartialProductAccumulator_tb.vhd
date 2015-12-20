--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:38:36 12/20/2015
-- Design Name:   
-- Module Name:   D:/ComputerArithmeticAssignment/LabAssignment3/MultiplicativeDivider/PartialProductAccumulator_tb.vhd
-- Project Name:  MultiplicativeDivider
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PartialProductAccumulator
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
 
ENTITY PartialProductAccumulator_tb IS
END PartialProductAccumulator_tb;
 
ARCHITECTURE behavior OF PartialProductAccumulator_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PartialProductAccumulator
    PORT(
         Ain : IN  std_logic_vector(15 downto 0);
         Bin : IN  std_logic_vector(15 downto 0);
         PP0 : OUT  std_logic_vector(16 downto 0);
         PP1 : OUT  std_logic_vector(16 downto 0);
         PP2 : OUT  std_logic_vector(16 downto 0);
         PP3 : OUT  std_logic_vector(16 downto 0);
         PP4 : OUT  std_logic_vector(16 downto 0);
         PP5 : OUT  std_logic_vector(16 downto 0);
         PP6 : OUT  std_logic_vector(16 downto 0);
         PP7 : OUT  std_logic_vector(16 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ain : std_logic_vector(15 downto 0) := (others => '0');
   signal Bin : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal PP0 : std_logic_vector(16 downto 0);
   signal PP1 : std_logic_vector(16 downto 0);
   signal PP2 : std_logic_vector(16 downto 0);
   signal PP3 : std_logic_vector(16 downto 0);
   signal PP4 : std_logic_vector(16 downto 0);
   signal PP5 : std_logic_vector(16 downto 0);
   signal PP6 : std_logic_vector(16 downto 0);
   signal PP7 : std_logic_vector(16 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PartialProductAccumulator PORT MAP (
          Ain => Ain,
          Bin => Bin,
          PP0 => PP0,
          PP1 => PP1,
          PP2 => PP2,
          PP3 => PP3,
          PP4 => PP4,
          PP5 => PP5,
          PP6 => PP6,
          PP7 => PP7
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			Ain <= "0000000000001111";
			Bin <= "0000000011110000";

      wait;
   end process;

END;
