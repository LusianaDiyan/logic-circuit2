----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:34:55 05/13/2019 
-- Design Name: 
-- Module Name:    clockdiv48and190 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clockdiv48and190 is
		Port ( mclk : in  STD_LOGIC; 
				clr : in  STD_LOGIC;           
				clk190 : out  STD_LOGIC;
				clk48 : out  STD_LOGIC); 
end clockdiv48and190;

architecture Behavioral of clockdiv48and190 is
	signal q:std_logic_vector(23 downto 0);
begin
		process(mclk, clr)
		begin
			if clr = '1' then
					q<= x"000000";
			elsif mclk' event and mclk = '1' then 	
					q <= q+1;
			end if;
				clk48 <= q(23);
				clk190 <= q(20);
		end process;	
end Behavioral;
