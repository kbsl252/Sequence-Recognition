library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SequenceRecon2 is
port(
	x, y, hor : in std_logic;
	s : out std_logic);
end SequenceRecon2;

architecture archi of SequenceRecon2 is
type state_type is (s0, s1, s2, s3, s4, s5, s6);
signal etat_present, etat_futur : state_type;
begin

process(hor)
begin
	if(rising_edge(hor)) then
		etat_present <= etat_futur;
	end if;
end process;

process(etat_present)
begin
	case etat_present is
		when s0 => if (x = '1' and y = '0') then etat_futur <= s1;
					  else etat_futur <= s0;
					  end if;
		when s1 => if (x = '0' and y = '0') then etat_futur <= s2;
					  else etat_futur <= s1;
					  end if;
		when s2 => if (x = '0' and y = '1') then etat_futur <= s3;
					  else etat_futur <= s2;
					  end if;
		when s3 => if (x = '0' and y = '0') then etat_futur <= s4;
					  else etat_futur <= s3;
					  end if;
		when s4 => if (x = '1' and y = '0') then etat_futur <= s5;
					  else etat_futur <= s4;
					  end if;
		when s5 => etat_futur <= s6; 
		when s6 => if (x = '0' or y = '1') then etat_futur <= s0;
					  else etat_futur <= s6;
					  end if;
		when others => etat_futur <= s0;
	end case;
end process;

s <= '0' when etat_present = s6 else '1';

end archi;

		
