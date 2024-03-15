library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fsm_moore is
--generic(clock_frequencyHz : integer := 50e6);
  Port ( 
    rst   : in std_logic;
    clock : in std_logic;    
    w     : in std_logic;
    z     : out std_logic
  );
end fsm_moore;

architecture rtl of fsm_moore is
    type estados is (A, B, C);
    signal y : estados;    
begin
    process(clock)
    begin
        if(rising_edge(clock))then
            if(rst = '1')then
                y <= A;
                z <= '0';
            
            else--(clock'event and clock = '1')then
                case y is
                    when A =>
                        z <= '0';
                        if(w = '1')then
                            y <= B;
                        end if;
                    when B =>
                        z <= '0';
                        if(w = '0')then
                            y <= A;
                        else
                            y <= C;
                        end if;
                    when C =>
                        z <= '1';
                        if(w = '0')then
                            y <= A;
                        end if;
                end case;
            end if;
        end if;
    -- <= '1' when y = C else '0';
    end process;
    --z <= '1' when y = C else '0';
end rtl;