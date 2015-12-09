--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:26:07 12/06/2015
-- Design Name:   
-- Module Name:   D:/ComputerArithmeticAssignment/LabAssignment2/MovingAverageFilter/registerarray_tb.vhd
-- Project Name:  MovingAverageFilter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegisterArray_16
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
use WORK.TYPEDECLARATION.all;
use std.textio.all; -- This enables file IO during simulation
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY registerarray_tb IS
END registerarray_tb;
 
ARCHITECTURE behavior OF registerarray_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterArray_16
    PORT(
         a : IN  std_logic_vector(10 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic;
         q : INOUT  reg_buff
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(10 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal q : reg_buff;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterArray_16 PORT MAP (
          a => a,
          clk => clk,
          rst => rst,
          q => q
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
		file OUTPUT_FILE : text open write_mode is "output_registerarray.txt";
	
		variable input_line : LINE;
		variable output_line: LINE;
		variable str : bit_vector(10 downto 0) ;
		variable b : boolean;
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	
      -- insert stimulus here 
			rst <= '0';
		
			for i in 1 to 7 loop -- read 1000 samples
			
				wait until clk'event and clk = '1'; -- wait until the positive edge of the clk
		
				--wait for clk_period 3/4; -- use this line to control the setup time in post place & route simulation
		
		
				readline (INPUT_FILE,input_line); -- read one line from the input file
				read(input_line,str);				 -- parse that line for a 10 bit vector
				a <= to_stdlogicvector(str);	 -- convert to std_logic_vector type
			
				write(output_line,to_bitvector(q(0)));
				writeline(output_file,output_line);		-- write the line to the output file
				write(output_line,to_bitvector(q(1)));
				writeline(output_file,output_line);		-- write the line to the output file
				write(output_line,to_bitvector(q(2)));
				writeline(output_file,output_line);		-- write the line to the output file
				write(output_line,to_bitvector(q(3)));
				writeline(output_file,output_line);		-- write the line to the output file
				write(output_line,to_bitvector(q(4)));
				writeline(output_file,output_line);		-- write the line to the output file
				write(output_line,to_bitvector(q(5)));
				writeline(output_file,output_line);		-- write the line to the output file
				write(output_line,to_bitvector(q(6)));
				writeline(output_file,output_line);		-- write the line to the output file
				write(output_line,to_bitvector(q(7)));
				writeline(output_file,output_line);		-- write the line to the output file
				write(output_line,to_bitvector(q(8)));
				writeline(output_file,output_line);		-- write the line to the output file
				write(output_line,to_bitvector(q(9)));
				writeline(output_file,output_line);		-- write the line to the output file
		
		
		
			end loop;

      --wait;
   end process;

END;
