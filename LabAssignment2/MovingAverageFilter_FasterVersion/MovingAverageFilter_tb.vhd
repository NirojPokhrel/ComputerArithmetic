--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:09:21 12/06/2015
-- Design Name:   
-- Module Name:   D:/ComputerArithmeticAssignment/LabAssignment2/MovingAverageFilter/MovingAverageFilter_tb.vhd
-- Project Name:  MovingAverageFilter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MovingAverageFilter
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
use ieee.numeric_std.all;


use std.textio.all; -- This enables file IO during simulation
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY MovingAverageFilter_tb IS
END MovingAverageFilter_tb;
 
ARCHITECTURE behavior OF MovingAverageFilter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MovingAverageFilter
    PORT(
         Ain : IN  std_logic_vector(10 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic;
         Qout : OUT  std_logic_vector(10 downto 0)
        );
    END COMPONENT;
    


   --Inputs
   signal Ain : std_logic_vector(10 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal Qout : std_logic_vector(10 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MovingAverageFilter PORT MAP (
          Ain => Ain,
          clk => clk,
          rst => rst,
          Qout => Qout
        );

   -- Clock process definitions
  clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
		file INPUT_FILE : text open read_mode is "input.txt";
		file OUTPUT_FILE : text open write_mode is "output.txt";
		file INPUT_FILE_DEC : text open write_mode is "input_dec.txt";
		file OUTPUT_FILE_DEC : text open write_mode is "output_dec.txt";
	
		variable input_line : LINE;
		variable output_line: LINE;
		variable output_line_dec: LINE;
		variable input_line_dec : LINE;
		variable str : bit_vector(10 downto 0) ;
   begin		
      -- hold reset state for 100 ns.
		rst <= '1';
      wait for 100 ns;	
      -- insert stimulus here 
			rst <= '0';
		
			for i in 1 to 1000 loop -- read 1000 samples
			
				wait until clk'event and clk = '1'; -- wait until the positive edge of the clk
		
				--wait for clk_period 3/4; -- use this line to control the setup time in post place & route simulation
		
				readline (INPUT_FILE,input_line); -- read one line from the input file
				read(input_line,str);				 -- parse that line for a 10 bit vector
				Ain <= to_stdlogicvector(str);	 -- convert to std_logic_vector type
			
			
				write(output_line,to_bitvector(Qout)); -- write the result to the output line
				writeline(output_file,output_line);		-- write the line to the output file
				write(output_line_dec,to_integer(signed(Qout))); -- write the result to the output line
				writeline(output_file_dec,output_line_dec);		-- write the line to the output file
				write(input_line_dec,to_integer(signed(Ain))); -- write the result to the output line
				writeline(INPUT_FILE_DEC,input_line_dec);		-- write the line to the output file
		
		
		
			end loop;

      wait;
   end process;

END;
