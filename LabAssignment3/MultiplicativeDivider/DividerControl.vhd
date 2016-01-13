
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DividerControl is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           LoadInput : out  STD_LOGIC;
			  UpdateOutput: out STD_LOGIC;
			  IterateCycle: out STD_LOGIC);
end DividerControl;

architecture Behavioral of DividerControl is
	type state_type is (state_1, state_2, state_3, state_4, state_5, state_6 ); 
   signal state, next_state : state_type; 
   --Declare internal signals for all outputs of the state-machine
   signal LoadInput_i, UpdateOutput_i, IterateCycle_i : STD_LOGIC;  -- example output signal
   
 
begin

	--Insert the following in the architecture after the begin keyword
   SYNC_PROC: process (clk)
   begin
      if (clk'event and clk = '1') then
         if (rst = '1') then
            state <= state_1;
				LoadInput <= '0';
				UpdateOutput <= '0';
				IterateCycle <= '0';
         else
            state <= next_state;
				LoadInput <= LoadInput_i;
				UpdateOutput <= UpdateOutput_i;
				IterateCycle <= IterateCycle_i;
         end if;        
      end if;
   end process;
 
   --MOORE State-Machine - Outputs based on state only
   OUTPUT_DECODE: process (state)
   begin
      --insert statements to decode internal output signals
      --below is simple example
      case (state) is
			when state_1 =>
				LoadInput_i <= '1';
				UpdateOutput_i <= '0';
				IterateCycle_i <= '0';
			when state_2 =>
				LoadInput_i <= '0';
				UpdateOutput_i <= '0';
				IterateCycle_i <= '1';
			when state_3 =>
				LoadInput_i <= '0';
				UpdateOutput_i <= '0';
				IterateCycle_i <= '1';
			when state_4 =>
				LoadInput_i <= '0';
				UpdateOutput_i <= '0';
				IterateCycle_i <= '1';
			when state_5 =>
				LoadInput_i <= '0';
				UpdateOutput_i <= '0';
				IterateCycle_i <= '1';
			when state_6 =>
				LoadInput_i <= '0';
				UpdateOutput_i <= '1';
				IterateCycle_i <= '1';
      end case;
   end process;
 
   NEXT_STATE_DECODE: process (state)
   begin
      --declare default state for next_state to avoid latches
      next_state <= state;  --default is to stay in current state
      --insert statements to decode next_state
      --below is a simple example
      case (state) is
         when state_1 =>
              next_state <= state_2;					
         when state_2 =>
               next_state <= state_3;
         when state_3 =>
					next_state <= state_4;
         when state_4 =>
					next_state <= state_5;
         when state_5 =>
					next_state <= state_6;
         when state_6 =>
					next_state <= state_1;
      end case;      
   end process;
end Behavioral;
