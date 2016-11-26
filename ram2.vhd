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
					ram2_data <= "0110100100000001"; 	--LI r1 1
				when x"0001" =>
					ram2_data <= "0110101000000001"; 	--LI r2 1
				when x"0002" =>
					ram2_data <= "0110101110000000"; 	--LI r3 80
				when x"0003" =>
					ram2_data <= "0011001101100000"; 	--SLL R3 R3 0
				when x"0004" =>
					ram2_data <= "0110110000001001"; 	--LI r4 9
				when x"0005" =>
					ram2_data <= "1101101100100000"; 	--SW R3 R1 0
				when x"0006" =>
					ram2_data <= "1101101101000001"; 	--SW R3 R2 1
				when x"0007" =>
					ram2_data <= "1110000101000101"; --ADDU R1 R2 R1
				when x"0008" =>
					ram2_data <= "1110000101001001"; --ADDU R1 R2 R2
				when x"0009" =>
					ram2_data <= "0100101100000010"; --ADDIU R3 2
				when x"000A" =>
					ram2_data <= "0100110011111111"; --ADDIU R4 FF
				when x"000B" =>
					ram2_data <= "0010110011111001"; --BNEZ R4 F9
				when x"000C" =>
					ram2_data <= "0110100000010111"; 	--LI r0 00010111
				when others =>
					ram2_data <= x"0000";
			end case;
		end if;

	end process;

end Behavioral;

