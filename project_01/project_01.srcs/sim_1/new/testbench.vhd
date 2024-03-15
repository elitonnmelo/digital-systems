library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
    Port ( 
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            q_and: out std_logic;
            q_or: out std_logic;
            q_sum: out std_logic;
            c: out std_logic
          );
end testbench;

architecture Behavioral of testbench is

    --HALF ADDER
    component testbench_half_adder is
        port(
           clock : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           q : out STD_LOGIC;
           c : out STD_LOGIC
        );    
    end component;
    
    --PORT AND:
    component gate_and is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            q: out std_logic
        );
   end component;
   
   --PORT OR:
   component gate_or is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            q: out std_logic
        );    
    end component;
    
    --PORT XOR:
    component gate_xor is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            q: out std_logic
        );    
    end component;
    
    --PORT NOT:
    component gate_not is
        port(
            clock: in std_logic;
            a: in std_logic;
            q: out std_logic
        );    
    end component;
    
    --PORT NOR:
    component gate_nor is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            q: out std_logic
        );    
    end component;
    
    --PORT NAND:
    component gate_nand is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            q: out std_logic
        );    
    end component;
    
    --PORT XNOR
    component gate_xnor is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            q: out std_logic
        );    
    end component;

    --DRIVER
    component driver is
        port(
            clock: in std_logic;
            a: in std_logic;
            q: inout std_logic
        );    
    end component;
        
    --signal clock: std_logic := '0';
    --signal a,b: std_logic := '0';
    --signal q_and: std_logic;
    --signal q_or: std_logic;
    signal q_xor: std_logic;
    signal q_not: std_logic;
    signal q_nor: std_logic;
    signal q_nand: std_logic;
    signal q_xnor: std_logic;
    signal q_driver: std_logic;
    constant clock_periodo:time:= 100 ns;
    
      
        
begin
    --clock<= not clock after clock_periodo/2;
    
    DUT: entity work.half_adder port map(clock,a, b, q_sum, c);
    DUT1: entity work.gate_and port map(clock,a,b,q_and);
    DUT2: entity work.gate_or port map(clock,a,b,q_or);
    DUT3: entity work.gate_xor port map(clock,a,b,q_xor);
    DUT4: entity work.gate_not port map(clock,a,q_not);
    DUT5: entity work.gate_nor port map(clock,a,b,q_nor);
    DUT6: entity work.gate_nand port map(clock,a,b,q_nand);
    DUT7: entity work.gate_xnor port map(clock,a,b,q_xnor);
    DUT8: entity work.driver port map(clock,a,q_driver);

    --estimulos:process
    --begin
       
        --teste1
--        a<='0';
--        b<='0';
--        wait for clock_periodo;
--        --teste2
--        a<='0';
--        b<='1';
--        wait for clock_periodo;
--        --teste3
--        a<='1';
--        b<='0';
--        wait for clock_periodo;
--        --teste4
--        a<='1';
--        b<='1';
--        wait for clock_periodo;
    
    --end process;
end Behavioral;