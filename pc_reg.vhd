----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:47:43 11/21/2016 
-- Design Name: 
-- Module Name:    pc_reg - Behavioral 
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

entity pc_reg is
    Port ( 
		rst : in  STD_LOGIC;
		clk : in  STD_LOGIC;
		stall : in STD_LOGIC;
		pc_i : in STD_LOGIC_VECTOR(15 downto 0);
		pc_o : out STD_LOGIC_VECTOR(15 downto 0)
		);
end pc_reg;

architecture Behavioral of pc_reg is

begin

	process (rst, clk)
	begin
		if (rst = '0') then  --复位，pc从0开始
			pc_o <= x"0000";  --x代表十六进制
		elsif (rising_edge(clk)) then 
			if (stall = '0') then
				pc_o <= pc_i;
			end if;
		end if;
	end process;
	
end Behavioral;

