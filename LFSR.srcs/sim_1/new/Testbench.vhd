library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Testbench is

end Testbench;

architecture Behavioral of Testbench is

component Main 
    Port (Led: out STD_LOGIC_VECTOR(3 downto 0);
        Display: out STD_LOGIC_VECTOR(6 downto 0);
        Botones: in STD_LOGIC_VECTOR(3 downto 0);
        switch: in STD_LOGIC;
        clock: in STD_LOGIC);
end component;

signal sigBotones : STD_LOGIC_VECTOR(3 downto 0);
signal sigLed : STD_LOGIC_VECTOR(3 downto 0);
signal sigclock : STD_LOGIC;
signal sigswitch : STD_LOGIC;
signal sigDisplay : STD_LOGIC_VECTOR(6 downto 0);

begin

UUT: Main
  Port map ( clock => sigclock,
         Led => sigLed,
         Botones => sigBotones,
         switch => sigswitch,
         Display => sigDisplay);
          
--component LFSR
--    Port ( clk      : in   std_logic ; 
--       value32 : out   std_logic_vector ( 31  downto  0 ); 
--       value16 : out   std_logic_vector ( 15  downto  0 ); 
--       value8   : out   std_logic_vector ( 7  downto  0 ); 
--       value4   : out   std_logic_vector ( 3  downto  0 );
--       value2   : out   std_logic_vector ( 1  downto  0 );
--       value2_2   : out   std_logic_vector ( 1  downto  0 );
--       value2_3   : out   std_logic_vector ( 1  downto  0 );
--       value2_4   : out   std_logic_vector ( 1  downto  0 ));
--end component;

--signal sigvalue32 : std_logic_vector ( 31  downto  0 );
--signal sigvalue16 : std_logic_vector ( 15  downto  0 );
--signal sigvalue8 : std_logic_vector ( 7  downto  0 );
--signal sigvalue4 : std_logic_vector ( 3  downto  0 );
--signal sigvalue2 : std_logic_vector ( 1  downto  0 );
--signal sigvalue2_2 : std_logic_vector ( 1  downto  0 );
--signal sigvalue2_3 : std_logic_vector ( 1  downto  0 );
--signal sigvalue2_4 : std_logic_vector ( 1  downto  0 );
--signal sigclk : STD_LOGIC;

--begin

--UUT: LFSR
--  Port map ( clk => sigclk,
--         value32 => sigvalue32,
--         value16 => sigvalue16,
--         value8 => sigvalue8,
--         value4 => sigvalue4,
--         value2 => sigvalue2,
--         value2_2 => sigvalue2_2,
--         value2_3 => sigvalue2_3,
--         value2_4 => sigvalue2_4);
         
--Process del clock, 100KHz     1S/50MHz*2 = 10ns
process 
begin
sigclock <= '0';
wait for 5ns;

sigclock <= '1';
wait for 5ns;
end process;


process
begin
sigswitch <= '0';
wait for 567ns;
sigswitch <= '1';
wait;        
end process;  

process
begin
sigBotones <= "0000";
wait for 51ms;
sigBotones <= "0100";
wait;        
end process;

end Behavioral;
