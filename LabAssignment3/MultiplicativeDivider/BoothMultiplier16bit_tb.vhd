--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:09:50 12/20/2015
-- Design Name:   
-- Module Name:   D:/ComputerArithmeticAssignment/LabAssignment3/MultiplicativeDivider/BoothMultiplier16bit_tb.vhd
-- Project Name:  MultiplicativeDivider
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
use std.textio.all; -- This enables file IO during simulation
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
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
		file INPUT_FILE1 : text open read_mode is "Input1_mul.txt";
		file INPUT_FILE2 : text open read_mode is "Input2_mul.txt";
		file OUTPUT_FILE : text open write_mode is "output.txt";
		file INPUT_FILE1_DEC : text open write_mode is "input1_dec.txt";
		file INPUT_FILE2_DEC : text open write_mode is "input2_dec.txt";
		file OUTPUT_FILE_DEC : text open write_mode is "output_dec.txt";
	
		variable input_line1, input_line2 : LINE;
		variable output_line: LINE;
		variable output_line_dec: LINE;
		variable input_line_dec1, input_line_dec2 : LINE;
		variable str1, str2 : bit_vector(15 downto 0) ;
   begin		
      -- hold reset state for 100 ns.
--		for i in 0 to 99 loop
--			wait for 100 ns;	
--			readline (INPUT_FILE1,input_line1); -- read one line from the input file
--			read(input_line1,str1);				 -- parse that line for a 10 bit vector
--			Ain <= to_stdlogicvector(str1);	 -- convert to std_logic_vector type
--			readline (INPUT_FILE2,input_line2); -- read one line from the input file
--			read(input_line2,str2);				 -- parse that line for a 10 bit vector
--			Bin <= to_stdlogicvector(str2);	 -- convert to std_logic_vector type
--			
--			
--			write(output_line,to_bitvector(Product)); -- write the result to the output line
--			writeline(output_file,output_line);		-- write the line to the output file
--			write(output_line_dec,to_integer(signed(Product))); -- write the result to the output line
--			writeline(output_file_dec,output_line_dec);		-- write the line to the output file
--			write(input_line_dec1,to_integer(signed(Ain))); -- write the result to the output line
--			writeline(INPUT_FILE1_DEC,input_line_dec1);		-- write the line to the output file
--			write(input_line_dec2,to_integer(signed(Bin))); -- write the result to the output line
--			writeline(INPUT_FILE2_DEC,input_line_dec2);		-- write the line to the output file
--		end loop;
		wait for 100 ns;
			Ain <= "0000011100000000";
			Bin <= "0000000000001110";

      -- insert stimulus here 


      wait;
   end process;

END;
