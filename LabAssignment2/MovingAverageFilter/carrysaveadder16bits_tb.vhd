--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:29:45 12/09/2015
-- Design Name:   
-- Module Name:   D:/ComputerArithmeticAssignment/LabAssignment2/MovingAverageFilter/carrysaveadder16bits_tb.vhd
-- Project Name:  MovingAverageFilter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CarrySaveAdder_16bits
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
 
ENTITY carrysaveadder16bits_tb IS
END carrysaveadder16bits_tb;
 
ARCHITECTURE behavior OF carrysaveadder16bits_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CarrySaveAdder_16bits
    PORT(
         a : IN  std_logic_vector(14 downto 0);
         b : IN  std_logic_vector(14 downto 0);
         c : IN  std_logic_vector(14 downto 0);
         d : IN  std_logic_vector(14 downto 0);
         sum : OUT  std_logic_vector(14 downto 0);
         cout : OUT  std_logic_vector(14 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(14 downto 0) := (others => '0');
   signal b : std_logic_vector(14 downto 0) := (others => '0');
   signal c : std_logic_vector(14 downto 0) := (others => '0');
   signal d : std_logic_vector(14 downto 0) := (others => '0');

 	--Outputs
   signal sum : std_logic_vector(14 downto 0);
   signal cout : std_logic_vector(14 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CarrySaveAdder_16bits PORT MAP (
          a => a,
          b => b,
          c => c,
          d => d,
          sum => sum,
          cout => cout
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			a <= "000010010010010";
			b <= "000010010010010";
			c <= "000011111001000";
			d <= "000000001000100";

      -- insert stimulus here 

      wait;
   end process;

END;
