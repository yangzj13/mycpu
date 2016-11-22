----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:03:21 11/22/2016 
-- Design Name: 
-- Module Name:    ram2 - Behavioral 
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

entity ram2 is
	port(
		ram2_en : in STD_LOGIC;
		ram2_we : in STD_LOGIC;
		ram2_oe : in STD_LOGIC;
		ram2_addr : in STD_LOGIC_VECTOR(15 downto 0);
		ram2_data : out STD_LOGIC_VECTOR(15 downto 0)
	);
end ram2;
	
architecture Behavioral of ram2 is
	
begin
	process (ram2_en, ram2_we, ram2_oe, ram2_addr)
	begin
		if (ram2_en = '1') then
			ram2_data <= x"0000";
		elsif ((ram2_oe = '0') and (ram2_we = '1')) then
			case ram2_addr is
				when x"0000" =>
					ram2_data <= "0100100100001000"; --ADDIU R1 8
					--ram2_data <= "1110100101001101"; --OR R1 R2
				when x"0010" =>
					ram2_data <= "1110101110001100"; --AND R3 R1
				when others =>
					ram2_data <= x"0000";
			end case;
		end if;

	end process;

end Behavioral;

