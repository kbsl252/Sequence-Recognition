library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SequenceRecon2 is
port(
	x, y, clk : in std_logic;
	s : out std_logic);
end SequenceRecon2;

architecture archi of SequenceRecon2 is
type state_type is (state0, state1, state2, state3, state4, state5, state6);
signal current_state, future_state : state_type;
begin

process(clk)
begin
	if(rising_edge(clk)) then
		current_state <= future_state;
	end if;
end process;

process(current_state)
begin
	case current_state is
		when state0 => if (x = '1' and y = '0') then future_state <= state1;
					  else future_state <= state0;
					  end if;
		when state1 => if (x = '0' and y = '0') then future_state <= state2;
					  else future_state <= state1;
					  end if;
		when state2 => if (x = '0' and y = '1') then future_state <= state3;
					  else future_state <= state2;
					  end if;
		when state3 => if (x = '0' and y = '0') then future_state <= state4;
					  else future_state <= state3;
					  end if;
		when state4 => if (x = '1' and y = '0') then future_state <= state5;
					  else future_state <= state4;
					  end if;
		when state5 => future_state <= state6; 
		when state6 => if (x = '0' or y = '1') then future_state <= state0;
					  else future_state <= state6;
					  end if;
		when others => future_state <= state0;
	end case;
end process;

s <= '0' when current_state = state6 else '1';

end archi;

		

