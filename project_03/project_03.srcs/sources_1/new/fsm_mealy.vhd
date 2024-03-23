
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fsm_mealy is
--generic(clock_frequencyHz : integer := 50e6);
  Port ( 
    rst   : in std_logic;
    clock : in std_logic;    
    w     : in std_logic;
    z     : out std_logic
  );
end fsm_mealy;

architecture rtl of fsm_mealy is
    type estados is (A, B);
    signal y : estados;    
begin
    process(clock, rst, y)
    begin
        if(rising_edge(clock))then
            if(rst = '1')then
                y <= A;
               -- z <= '0';
            
            else--(clock'event and clock = '1')then
                case y is
                    when A =>
                        if(w = '1')then
                            y <= B;
                         --   z <= '0';
                        end if;
                    when B =>          
                        if(w = '0')then
                            y <= A;
                           -- z <= '0';
                        else
                            y <= B;
                            --z <= '1';
                        end if;
                end case;
            end if;
        end if;
    -- z <= '1' when y = C else '0';
    end process;
    process(clock, rst, y, w)
        begin
        case y is
            when A =>
                z <= '0';
            when B =>
                z <= w;
        end case;
     end process;

end rtl;