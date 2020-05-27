library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity controller is

Port (  clk     :   in STD_LOGIC;
        
        reset   :   out STD_LOGIC;--   := '0';
        enable  :   out STD_LOGIC   := '0';
        start   :   out STD_LOGIC   := '0';
        
        trig    :   in STD_LOGIC;
        done    :   in STD_LOGIC--    := '1'
);

end controller;

architecture Behavioral of controller is


constant CLK_PD     : time      := 10 ns;
constant mySize     : integer   := 16;

constant MAC_PD     : time      := mySize * CLK_PD;--160 ns;

signal myStart                  : STD_LOGIC := '0';
signal myEnable, myReset        : STD_LOGIC := '0';

begin

reset   <= myReset;
enable  <= myEnable;
start   <= myStart;

--  checks for myStart signal from processor 
TRIGGER: process (clk, trig) is
begin
--if rising_edge(clk) then
    --  check status of trigger only if 'done'
    if done = '1' AND myEnable = '0' then
        if rising_edge(trig)then-- = '1' then
            myStart   <= '1';
        end if;
        
--    else
--        myStart <= '0';
    end if;
--end if;
end process;


--  main run process
RUN: process (clk) is
begin

if rising_edge(clk) then
--  myStartup can only happen if myStart signal has been reset to 0
    if myStart = '1' then
        myReset <= done;
        myEnable <= NOT done;
    end if;
    
--    if done = '0' then
--        myEnable <= '1';    
    
--    elsif done = '1' AND myEnable <= '1' then
--        myStart  <= '0';
----        myEnable <= '0';
    
--    end if;  
   
end if;
end process;

end Behavioral;
