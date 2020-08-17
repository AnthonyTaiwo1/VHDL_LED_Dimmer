-- VHDL implementation of a
-- Switch to 7-segment

--    Title:        Group project
--    Designer:     Group E
--    Date:         
--    Version No:    
--    Target            DE2 board - EP4CE115F29C7


library ieee;
use ieee.std_logic_1164.all; -- identifying the libaries
use ieee.numeric_std.all;



---------Top Level Entity--------------


entity Assignment is port (
     z: in integer range 0 to 256;
     seg1, seg2, seg3: out std_logic_vector (6 downto 0)); 
end Assignment;

architecture module of Assignment is 

----------Seven Seg Component--------

component Seven_seg 
   port (Seven_Segment : out STD_LOGIC_VECTOR (6 downto 0);
   a: in integer range 0 to 9);	
   end component;


----------Seperator component-----------
component  Seven_seg 
      port ( x: in integer range 0 to 256;              -- 8 Input switches ranging from 0 to 256 
        p,q,r: out integer range 0 to 15;        -- Output 7-segment display ranging from 0 to 15
        b : inout integer range 0 to 256);         -- Variable b used for calculations 
end component;





  signal siga, sigb, sigc: integer range 0 to 9;



begin 
instance1: segment port map (a=>siga, Seven_Segment=>seg1);
instance2: segment port map (a=>sigb, Seven_Segment=>seg2);
instance3: segment port map (a=>sigc, Seven_Segment=>seg3);
instance4: Seperator port map (z=>x, p=> siga, r=> sigb, q=> sigc);

end module;


--------------seven seg-----------

library ieee;
use ieee.std_logic_1164.all; -- identifying the libaries
use ieee.numeric_std.all;

entity Seven_seg is port (
    Seven_Segment : out STD_LOGIC_VECTOR (6 downto 0);
    a: in integer range 0 to 9;)

end Seven_seg


architecture module of Seven_seg is
begin

with a select
Seven_Segment <=  		
 "0000001" when 0,		
 "1001111" when 1,
 "0010010" when 2,
 "0000110" when 3,           
 "1001100" when 4,
 "0100100" when 5,
 "0100000" when 6,
 "0001111" when 7,
 "0000000" when 8,
 "0000100" when 9,
 "1111111" when others; 

end module;


------------------seperator---------

library ieee;
use ieee.std_logic_1164.all; -- identifying the libaries
use ieee.numeric_std.all;



entity Seven_seg is port (
        x: in integer range 0 to 256;              -- 8 Input switches ranging from 0 to 256 
        p,q,r  : out integer range 0 to 15;        -- Output 7-segment display ranging from 0 to 15
        b : inout integer range 0 to 256);         -- Variable b used for calculations 
end Seven_seg;




architecture module of Seven_seg is
begin
        b<=x/10;                                   -- Variable b calculation
        q<=x rem 10;                               -- q (7 segment 3) calculation 
        p<=b/10;                                   -- p (7 segment 1) calculation 
        r<=b rem 10;                               -- r (7 segment 2) calculation 
        
end module;
