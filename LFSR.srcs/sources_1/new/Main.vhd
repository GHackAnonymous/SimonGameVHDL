library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Main is
    Port ( 
        Led: out STD_LOGIC_VECTOR(3 downto 0);
        Display: out STD_LOGIC_VECTOR(6 downto 0);
        Anode: out STD_LOGIC_VECTOR(3 downto 0);
        Botones: in STD_LOGIC_VECTOR(3 downto 0);
        switch: in STD_LOGIC;
        clock: in STD_LOGIC);
end Main;

architecture Behavioral of Main is

component  LFSR  is 
    Port ( clk      : in   std_logic ; 
           value32 : out   std_logic_vector ( 31  downto  0 ); 
           value16 : out   std_logic_vector ( 15  downto  0 ); 
           value8   : out   std_logic_vector ( 7  downto  0 );
           value4   : out   std_logic_vector ( 3  downto  0 );
           value2   : out   std_logic_vector ( 1  downto  0 );
           value2_2   : out   std_logic_vector ( 1  downto  0 );
           value2_3   : out   std_logic_vector ( 1  downto  0 );
           value2_4   : out   std_logic_vector ( 1  downto  0 ));
end  component ; 


signal sig1, sig2, sig3, sig4: STD_LOGIC_VECTOR(1 downto 0);
signal sigvalue2, sigvalue2_2, sigvalue2_3, sigvalue2_4: STD_LOGIC_VECTOR (1 downto 0);
signal contador_comienzo: INTEGER:= 0;
signal contador_tiempo: INTEGER:= 0;
signal contador_tiempo2: INTEGER:= 0;
signal contador_tiempo3: INTEGER:= 0;
signal contador_tiempo4: INTEGER:= 0;
signal contador_tiempo5: INTEGER:= 0;
signal contador_tiempo6: INTEGER:= 0;
signal contador_tiempo7: INTEGER:= 0;
signal contador_tiempo8: INTEGER:= 0;
signal contador_tiempo9: INTEGER:= 0;
signal contador_tiempo10: INTEGER:= 0;
signal contador_tiempo11: INTEGER:= 0;
signal contador_tiempo12: INTEGER:= 0;
signal contador_tiempo13: INTEGER:= 0;
signal contador_tiempo14: INTEGER:= 0;
signal contador_tiempo15: INTEGER:= 0;
signal contador_tiempo16: INTEGER:= 0;
signal contador_tiempo17: INTEGER:= 0;
signal contador_tiempo18: INTEGER:= 0;
signal contador_tiempo19: INTEGER:= 0;
signal contador_tiempo20: INTEGER:= 0;
signal contador_espera: INTEGER:= 0;
signal contador_espera2: INTEGER:= 0;
signal contador_espera3: INTEGER:= 0;
signal contador_espera4: INTEGER:= 0;
signal contador_espera5: INTEGER:= 0;
signal contador_espera6: INTEGER:= 0;
signal contador_espera7: INTEGER:= 0;
signal contador_espera8: INTEGER:= 0;
signal contador_espera9: INTEGER:= 0;
signal contador_espera10: INTEGER:= 0;
signal contador_espera11: INTEGER:= 0;
signal contador_espera12: INTEGER:= 0;
signal contador1: INTEGER:= 0;
signal contador2: INTEGER:= 0;
signal contador3: INTEGER:= 0;
signal contador4: INTEGER:= 0;
signal arsig1 : STD_LOGIC_VECTOR (3 downto 0);
signal arsig2 : STD_LOGIC_VECTOR (3 downto 0);
signal arsig3 : STD_LOGIC_VECTOR (3 downto 0);
signal arsig4 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL VALORANODO: INTEGER := 0;
SIGNAL VALORDISPLAY: INTEGER := 0;
SIGNAL VALORANODO2: INTEGER := 0;
SIGNAL VALORDISPLAY2: INTEGER := 0;

CONSTANT MAX : INTEGER := 600000000;
CONSTANT TIEMPO : INTEGER := 100000000;
CONSTANT DISPLAYED: INTEGER := 4000;

TYPE STATE_TYPE IS(s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11,
 s12, s13, s14, s15, s16, s17, s18, s19, s20, perder, ganar);
SIGNAL STATE: STATE_TYPE;
SIGNAL ESTADOS: STATE_TYPE;

type boolean is (false,true);
signal valores: boolean := false;
signal estado: boolean := false;
signal ganado: boolean := false;
signal perdido: boolean := false;


begin

U0: LFSR port map (clk => clock, value2 => sigvalue2, value2_2 => sigvalue2_2, value2_3 => sigvalue2_3, value2_4 => sigvalue2_4);

meter_valores: process(clock)
begin
if(switch = '1')then
    if(valores = false)then
        sig1 <= sigvalue2;
        sig2 <= sigvalue2_2;
        sig3 <= sigvalue2_3;
        sig4 <= sigvalue2_4;
        valores <= true;
    end if;
end if;
end process;


simon: process (clock)

begin

if(rising_edge(clock)) then
if(estado = false) then
    if(contador_comienzo < MAX) then
        contador_comienzo <= contador_comienzo + 1;
        
    end if;
    
    if(contador_comienzo >= MAX) then
    
    case STATE is
    
        --Primer turno
    
        when s0 =>  --Se enciende primer led
                     Led <= arsig1;
                     if(contador_tiempo >= TIEMPO)then
                         Led <= "0000";
                         STATE <= s1;
                     end if;
                     contador_tiempo <= contador_tiempo +1;
                     
     
         when s1 =>   --Interacción usuario primer led
                   if(contador_tiempo2 <= MAX)then 
                   if(Botones /= "0000")then
                       if(Botones = arsig1)then     
                           STATE <= s2;  
                       end if;
                       if(Botones /= arsig1)then
                           STATE <= perder;
                       end if;
                   end if;
                   contador_tiempo2 <= contador_tiempo2 + 1;
                  
               end if;
                if(contador_tiempo2 > MAX) then
                   STATE <= perder;
                end if;
        
        -- Segundo turno
    
        when s2 =>  --Se enciende primer led
                     Led <= arsig1;
                     if(contador_tiempo3 >= TIEMPO)then
                         Led <= "0000";
                         STATE <= s3;
                     end if;
                     contador_tiempo3 <= contador_tiempo3 +1;
                     
         when s3 =>   --Se enciende el segundo led
              if(contador_espera < TIEMPO)then
                    contador_espera <= contador_espera + 1;
                    STATE <= s3;
              end if;
              if (contador_espera >= TIEMPO) then
                  Led <= arsig2;
                  if(contador_tiempo4 >= TIEMPO)then
                     Led <= "0000";
                     STATE <= s4;
                  end if;
                  contador_tiempo4 <= contador_tiempo4 +1;
              end if;
    
         when s4 =>   --Interacción usuario primer led
                   if(contador_tiempo5 <= MAX)then
                   if(Botones /= "0000")then
                       if(Botones = arsig1)then     
                           STATE <= s5;
                           end if;
                       if(Botones /= arsig1)then
                           STATE <= perder;
                           end if;
                   end if;
                   contador_tiempo5 <= contador_tiempo5 + 1;
               end if;
               if(contador_tiempo5 > MAX) then
                     STATE <= perder;
               end if;
           when s5 =>   --Interacción usuario segundo led
               if(contador_espera2 < TIEMPO)then
                   contador_espera2 <= contador_espera2 + 1;
               end if;
               if(contador_espera2 >= TIEMPO)then
                   if(contador_tiempo6 <= MAX)then
                          if(Botones /= "0000")then
                              if(Botones = arsig2)then     
                                  STATE <= s6;
                                  end if;
                              if(Botones /= arsig2)then
                                  STATE <= perder;
                                  end if;
                         
                          end if;
                contador_tiempo6 <= contador_tiempo6 + 1;
                    end if;
               end if;
               if(contador_tiempo6 > MAX) then
                     STATE <= perder;
               end if;
    
        
        -- Tercer turno
        
        when s6 =>  --Se enciende primer led
                     Led <= arsig1;
                     if(contador_tiempo7 >= TIEMPO)then
                         Led <= "0000";
                         STATE <= s7;
                     end if;
                     contador_tiempo7 <= contador_tiempo7 +1;
                     
         when s7 =>   --Se enciende el segundo led
              if(contador_espera3 < TIEMPO)then
                    contador_espera3 <= contador_espera3 + 1;
                    STATE <= s7;
              end if;
              if (contador_espera3 >= TIEMPO) then
                  Led <= arsig2;
                  if(contador_tiempo8 >= TIEMPO)then
                     Led <= "0000";
                     STATE <= s8;
                  end if;
                  contador_tiempo8 <= contador_tiempo8 +1;
              end if;
         when s8 =>   --Se enciende el tercer led
              if(contador_espera4 < TIEMPO)then
                 contador_espera4 <= contador_espera4 + 1;
                 STATE <= s8;
              end if;
              if (contador_espera4 >= TIEMPO) then
                  Led <= arsig3;
                  if(contador_tiempo9 >= TIEMPO)then
                     Led <= "0000";
                     STATE <= s9;
                  end if;
                  contador_tiempo9 <= contador_tiempo9 +1;
              end if;
     
         when s9 =>   --Interacción usuario primer led
                   if(contador_tiempo10 <= MAX)then
                   if(Botones /= "0000")then
                       if(Botones = arsig1)then     
                           STATE <= s10;
                           end if;
                       if(Botones /= arsig1)then
                           STATE <= perder;
                           end if;
                   end if;
                   contador_tiempo10 <= contador_tiempo10 + 1;
               end if;
               if(contador_tiempo10 > MAX) then
                     STATE <= perder;
               end if;
           when s10 =>   --Interacción usuario segundo led
               if(contador_espera5 < TIEMPO)then
                   contador_espera5 <= contador_espera5 + 1;
               end if;
               if(contador_espera5 >= TIEMPO)then
                   if(contador_tiempo11 <= MAX)then
                          if(Botones /= "0000")then
                              if(Botones = arsig2)then     
                                  STATE <= s11;
                                  end if;
                              if(Botones /= arsig2)then
                                  STATE <= perder;
                                  end if;
                         
                          end if;
                contador_tiempo11 <= contador_tiempo11 + 1;
                    end if;
               end if;
               if(contador_tiempo11 > MAX) then
                     STATE <= perder;
               end if;
          when s11 =>   --Interacción usuario tercer led
                if(contador_espera6 < TIEMPO)then
                    contador_espera6 <= contador_espera6 + 1;
                end if;
                if(contador_espera6 >= TIEMPO)then
                    if(contador_tiempo12 <= MAX)then
                           if(Botones /= "0000")then
                               if(Botones = arsig3)then     
                                   STATE <= s12;
                                   end if;
                               if(Botones /= arsig3)then
                                   STATE <= perder;
                                   end if;
                           end if;
                 contador_tiempo12 <= contador_tiempo12 + 1;
                       end if;
                end if;
                if(contador_tiempo12 > MAX) then
                      STATE <= perder;
                end if;
    
    
        -- Cuarto turno
         when s12 =>  --Se enciende primer led
                     Led <= arsig1;
                     if(contador_tiempo13 >= TIEMPO)then
                         Led <= "0000";
                         contador_tiempo13 <= 0;
                         contador_espera7 <= 0;
                         STATE <= s13;
                     end if;
                     contador_tiempo13 <= contador_tiempo13 +1;
                     
         when s13 =>   --Se enciende el segundo led
              if(contador_espera7 < TIEMPO)then
                    contador_espera7 <= contador_espera7 + 1;
                    STATE <= s13;
              end if;
              if (contador_espera7 >= TIEMPO) then
                  Led <= arsig2;
                  if(contador_tiempo14 >= TIEMPO)then
                     Led <= "0000";
                     STATE <= s14;
                  end if;
                  contador_tiempo14 <= contador_tiempo14 +1;
              end if;
         when s14 =>   --Se enciende el tercer led
              if(contador_espera8 < TIEMPO)then
                 contador_espera8 <= contador_espera8 + 1;
                 STATE <= s14;
              end if;
              if (contador_espera8 >= TIEMPO) then
                  Led <= arsig3;
                  if(contador_tiempo15 >= TIEMPO)then
                     Led <= "0000";
                     STATE <= s15;
                  end if;
                  contador_tiempo15 <= contador_tiempo15 +1;
              end if;
         when s15 =>   --Se enciende el cuarto led
               if(contador_espera9 < TIEMPO)then
                  contador_espera9 <= contador_espera9 + 1;
                  STATE <= s15;
               end if;
               if (contador_espera9 >= TIEMPO) then
                   Led <= arsig4;
                   if(contador_tiempo16 >= TIEMPO)then
                      Led <= "0000";
                      STATE <= s16;
                   end if;
                   contador_tiempo16 <= contador_tiempo16 +1;
               end if;
         when s16 =>   --Interacción usuario primer led
                   if(contador_tiempo17 <= MAX)then
                   if(Botones /= "0000")then
                       if(Botones = arsig1)then     
                           STATE <= s17;
                           end if;
                       if(Botones /= arsig1)then
                           STATE <= perder;
                           end if;
                   end if;
                   contador_tiempo17 <= contador_tiempo17 + 1;
               end if;
               if(contador_tiempo17 > MAX) then
                     STATE <= perder;
               end if;
           when s17 =>   --Interacción usuario segundo led
               if(contador_espera10 < TIEMPO)then
                   contador_espera10 <= contador_espera10 + 1;
               end if;
               if(contador_espera10 >= TIEMPO)then
                   if(contador_tiempo18 <= MAX)then
                          if(Botones /= "0000")then
                              if(Botones = arsig2)then     
                                  STATE <= s18;
                                  end if;
                              if(Botones /= arsig2)then
                                  STATE <= perder;
                                  end if;
                         
                          end if;
                contador_tiempo18 <= contador_tiempo18 + 1;
                    end if;
               end if;
               if(contador_tiempo18 > MAX) then
                     STATE <= perder;
               end if;
          when s18 =>   --Interacción usuario tercer led
                if(contador_espera11 < TIEMPO)then
                    contador_espera11 <= contador_espera11 + 1;
                end if;
                if(contador_espera11 >= TIEMPO)then
                    if(contador_tiempo19 <= MAX)then
                           if(Botones /= "0000")then
                               if(Botones = arsig3)then     
                                   STATE <= s19;
                                   end if;
                               if(Botones /= arsig3)then
                                   STATE <= perder;
                                   end if;
                           end if;
                 contador_tiempo19 <= contador_tiempo19 + 1;
                       end if;
                end if;
                if(contador_tiempo19 > MAX) then
                      STATE <= perder;
                end if;
          when s19 =>   --Interacción usuario cuarto led
                  if(contador_espera12 < TIEMPO)then
                      contador_espera12 <= contador_espera12 + 1;
                  end if;
                  if(contador_espera12 >= TIEMPO)then
                      if(contador_tiempo20 <= MAX)then
                             if(Botones /= "0000")then
                                 if(Botones = arsig4)then     
                                     STATE <= ganar;
                                     end if;
                                 if(Botones /= arsig4)then
                                     STATE <= perder;
                                     end if;
                                end if;
                             contador_tiempo20 <= contador_tiempo20 + 1;
                         end if;
                  end if; 
                  if(contador_tiempo20 > MAX) then
                        STATE <= perder;
                  end if;
        when ganar =>
             if(estado = false) then
                ganado <= true;
             end if;
             estado <= true;
        when perder =>
        if(estado = false) then
           perdido <= true;
        end if;
        estado <= true;
        when others => STATE <= s0;
            
    end case;
    
    end if;
end if;
end if;
end process;


DisplayProcess: process (clock)

begin
if(rising_edge(clock)) then 
    if(estado = true) then
        case ESTADOS is
            when s0 =>
                if(ganado = true) then
                     ESTADOS <= s2;
                end if;
                if(perdido = true)then
                     ESTADOS <= s1;
            end if;
    
            when s1 =>
                  contador1 <= contador1 + 1;
                  if (contador1 >= DISPLAYED) then
                    contador1 <= 0;
                    ESTADOS <= s3;
                  end if;
            when s2 =>
                contador1 <= contador1 + 1;
                if (contador1 >= DISPLAYED) then
                  contador1 <= 0;
                  ESTADOS <= s4;
                end if;
            when s3 =>
                  contador2 <= contador2 + 1;
                  if (contador2 >= DISPLAYED) then
                    contador2 <= 0;
                    ESTADOS <= s5;
                  end if;
            when s4 =>
                contador2 <= contador2 + 1;
                if (contador2 >= DISPLAYED) then
                  contador2 <= 0;
                  ESTADOS <= s6;
                end if;
            when s5 =>
                   contador3 <= contador3 + 1;
                   if (contador3 >= DISPLAYED) then
                     contador3 <= 0;
                     ESTADOS <= s7;
                   end if;
             when s6 =>
                   contador3 <= contador3 + 1;
                   if (contador3 >= DISPLAYED) then
                     contador3 <= 0;
                     ESTADOS <= s2;
                   end if;
            when s7 =>
                  contador4 <= contador4 + 1;
                  if (contador4 >= DISPLAYED) then
                    contador4 <= 0;
                    ESTADOS <= s1;
                  end if;
            when others => 
                    ESTADOS <= s0;
    end case;		
end if;
end if;
end process;

with ESTADOS select Anode<=
    "0111" when s1,
    "1011" when s2,
    "1011" when s3,
    "1101" when s4,
    "1101" when s5,
    "1110" when s6,
    "1110" when s7,
    "1111" when others;

with ESTADOS select Display<=
    "1000111" when s1,
    "0000001" when s2,
    "1000000" when s3,
    "1111001" when s4,
    "0010010" when s5,
    "1001000" when s6,
    "0000110" when s7,
    "1111111" when others;

with sig1 select arsig1 <=
    "1000" when "00",
    "0100" when "01",
    "0010" when "10",
    "0001" when others;
with sig2 select arsig2 <=
    "1000" when "00",
    "0100" when "01",
    "0010" when "10",
    "0001" when others;
with sig3 select arsig3 <=
    "1000" when "00",
    "0100" when "01",
    "0010" when "10",
    "0001" when others;
with sig4 select arsig4 <=
    "1000" when "00",
    "0100" when "01",
    "0010" when "10",
    "0001" when others;

end Behavioral;