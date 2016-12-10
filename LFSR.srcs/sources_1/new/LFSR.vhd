library  IEEE ; 
use  IEEE . Std_logic_1164 . ALL ; 
use  IEEE . NUMERIC_STD . ALL ; 

entity  LFSR  is 
    Port ( clk      : in   std_logic ; 
           value32 : out   std_logic_vector ( 31  downto  0 ); 
           value16 : out   std_logic_vector ( 15  downto  0 ); 
           value8   : out   std_logic_vector ( 7  downto  0 );
           value4   : out   std_logic_vector ( 3  downto  0 );
           value2   : out   std_logic_vector ( 1  downto  0 );
           value2_2   : out   std_logic_vector ( 1  downto  0 );
           value2_3   : out   std_logic_vector ( 1  downto  0 );
           value2_4   : out   std_logic_vector ( 1  downto  0 ));
end  LFSR ; 

architecture  Behavioral  of  LFSR  is 
signal  rnd32 : std_logic_vector ( 31  downto  0 ):= ( others => '0' ); 
signal  rnd16 : std_logic_vector ( 15  downto  0 ):= ( others => '0' ); 
signal  rnd8   : std_logic_vector ( 7  downto  0 ):= ( others => '0' ); 
signal  rnd4   : std_logic_vector ( 3  downto  0 ):= ( others => '0' ); 
signal  rnd2   : std_logic_vector ( 1  downto  0 ):= ( others => '0' ); 
signal  rnd2_2   : std_logic_vector ( 1  downto  0 ):= ( others => '0' );
signal  rnd2_3   : std_logic_vector ( 1  downto  0 ):= ( others => '0' );
signal  rnd2_4   : std_logic_vector ( 1  downto  0 ):= ( others => '0' );
begin 
   process  begin 
      wait  until  rising_edge ( CLK ); 
       rnd2 (1) <= rnd2 (0);
       rnd2 (0) <= not rnd8(3) XOR  rnd8(1); 
       rnd2_2 (1) <= rnd2 (0);
       rnd2_2 (0) <= not rnd8(4) XOR  rnd8(2);
       rnd2_3 (1) <= rnd2 (0);
       rnd2_3 (0) <= not rnd8(5) XOR  rnd8(3);
       rnd2_4 (1) <= rnd2 (0);
       rnd2_4 (0) <= not rnd8(6) XOR  rnd8(0); 
       rnd4 ( 3  downto  1 ) <= rnd4 ( 2  downto  0 ); 
       rnd4 ( 0 ) <= not ( rnd4 ( 3 ) XOR  rnd8 ( 2 ) XOR  rnd8 ( 1 )); 
       rnd8 ( 7  downto  1 ) <= rnd8 ( 6  downto  0 ); 
       rnd8 ( 0 ) <= not ( rnd8 ( 7 ) XOR  rnd8 ( 6 ) XOR  rnd8 ( 4 )); 
       rnd16 ( 15  downto  1 ) <= rnd16 ( 14  downto  0 ); 
       rnd16 ( 0 ) <= not ( rnd16 ( 15 ) XOR  rnd16 ( 14 ) XOR  rnd16 ( 13 ) XOR  rnd16 ( 4 )); 
       rnd32 ( 31  downto  1 ) <= rnd32 ( 30  downto  0 ); 
       rnd32 ( 0 ) <= not ( rnd32 ( 31 ) XOR  rnd32 ( 22 ) XOR  rnd32 ( 2 ) XOR  rnd32 ( 1 )); 
   end  process ; 
   value32 <= rnd32 ; 
   value16 <= rnd16 ; 
   value8   <= rnd8 ; 
   value4 <= rnd4 ; 
   value2 <= rnd2;
   value2_2 <= rnd2_2;
   value2_3 <= rnd2_3;
   value2_4 <= rnd2_4;
end  Behavioral ;