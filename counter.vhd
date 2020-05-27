
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myCounter is
Port (  clk     :   in  STD_LOGIC;
        reset   :   in  STD_LOGIC;--   := '0';
        enable  :   in  STD_LOGIC   := '0';
        count   :   out integer     := 0;
        done    :   out STD_LOGIC   := '1' 
);
end myCounter;


architecture Behavioral of myCounter is

constant N      : integer := 16;
signal myCount    : integer := 0;
begin

count <= myCount;

myCountUP : process (clk) is
begin
if rising_edge(clk) then
    if reset = '1' then
        done    <= '0';
        myCount <= 0;
    
    elsif enable = '1' then
        
        if myCount = N then
            myCount <= myCount;
            done  <= '1';       
        else
            myCount <= myCount + 1;
        end if;
        
    else
        myCount   <= myCount;

    end if;
end if;
end process;
end Behavioral;





