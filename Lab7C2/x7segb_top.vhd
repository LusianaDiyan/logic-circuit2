----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:32:57 05/12/2019 
-- Design Name: 
-- Module Name:    x7segb_top - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity x7segb_top is
		port(clk: in std_logic;
				btn: in std_logic_vector(3 downto 0);
				sw: in std_logic_vector (7 downto 0);
				a_to_g: out std_logic_vector (6 downto 0);
				an: out std_logic_vector (3 downto 0);
				dp: out std_logic);
end x7segb_top;

architecture Behavioral of x7segb_top is
		component x7segb is
		port(x:in std_logic_vector (15 downto 0);
			clk: in std_logic;
			clr: in std_logic;
			a_to_g: out std_logic_vector (6 downto 0);
			an: out std_logic_vector (3 downto 0);
			dp: out std_logic);
		end component;
		signal x: std_logic_vector(15 downto 0);
begin
		x<=sw & btn(2 downto 0) & "01010";
		x2: x7segb port map
		(x=>x, clk=>clk, clr=>btn(3), a_to_g=>a_to_g, an=>an, dp=>dp);

end Behavioral;

