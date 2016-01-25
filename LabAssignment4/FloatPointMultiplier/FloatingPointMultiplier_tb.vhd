--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:11:35 01/25/2016
-- Design Name:   
-- Module Name:   D:/ComputerArithmeticAssignment/LabAssignment4/FloatPointMultiplier/FloatingPointMultiplier_tb.vhd
-- Project Name:  FloatPointMultiplier
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FloatingPointMultiplier
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
 
ENTITY FloatingPointMultiplier_tb IS
END FloatingPointMultiplier_tb;
 
ARCHITECTURE behavior OF FloatingPointMultiplier_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FloatingPointMultiplier
    PORT(
         Ain : IN  std_logic_vector(22 downto 0);
         Bin : IN  std_logic_vector(22 downto 0);
         Overflow_flag : OUT  std_logic;
         Underflow_flag : OUT  std_logic;
         Sign_flag : OUT  std_logic;
         Zero_flag : OUT  std_logic;
         Aout : OUT  std_logic_vector(22 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ain : std_logic_vector(22 downto 0) := (others => '0');
   signal Bin : std_logic_vector(22 downto 0) := (others => '0');

 	--Outputs
   signal Overflow_flag : std_logic;
   signal Underflow_flag : std_logic;
   signal Sign_flag : std_logic;
   signal Zero_flag : std_logic;
   signal Aout : std_logic_vector(22 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FloatingPointMultiplier PORT MAP (
          Ain => Ain,
          Bin => Bin,
          Overflow_flag => Overflow_flag,
          Underflow_flag => Underflow_flag,
          Sign_flag => Sign_flag,
          Zero_flag => Zero_flag,
          Aout => Aout
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			Ain <= "01000001000011000000000";
			Bin <= "10000100000000000111101";

      wait;
   end process;

END;
