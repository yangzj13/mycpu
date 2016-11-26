----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:31:52 11/27/2016 
-- Design Name: 
-- Module Name:    ram1 - Behavioral 
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

entity ram1 is
	port(
		ram1_en : in STD_LOGIC;
		ram1_we : in STD_LOGIC;
		ram1_oe : in STD_LOGIC;
		ram1_addr : in STD_LOGIC_VECTOR(15 downto 0);
		ram1_data_r : out STD_LOGIC_VECTOR(15 downto 0);
		ram1_data_w : in STD_LOGIC_VECTOR(15 downto 0)
	);
end ram1;

architecture Behavioral of ram1 is

signal ram1_data_0 : STD_LOGIC_VECTOR(15 downto 0);
signal ram1_data_1 : STD_LOGIC_VECTOR(15 downto 0);
signal ram1_data_2 : STD_LOGIC_VECTOR(15 downto 0);
signal ram1_data_3 : STD_LOGIC_VECTOR(15 downto 0);
signal ram1_data_4 : STD_LOGIC_VECTOR(15 downto 0);
signal ram1_data_5 : STD_LOGIC_VECTOR(15 downto 0);
signal ram1_data_6 : STD_LOGIC_VECTOR(15 downto 0);
signal ram1_data_7 : STD_LOGIC_VECTOR(15 downto 0);
signal ram1_data_8 : STD_LOGIC_VECTOR(15 downto 0);
signal ram1_data_9 : STD_LOGIC_VECTOR(15 downto 0);
signal ram1_data_10 : STD_LOGIC_VECTOR(15 downto 0);


begin
	
	process (ram1_en, ram1_we, ram1_oe, ram1_addr)
	begin
		if (ram1_en = '1') then
			ram1_data_r <= x"0000";
		elsif ((ram1_oe = '0') and (ram1_we = '1')) then
			case ram1_addr is
				when x"8000" =>
					ram1_data_r <= ram1_data_0; 	
				when x"8001" =>
					ram1_data_r <= ram1_data_1; 	
				when x"8002" =>
					ram1_data_r <= ram1_data_2;
				when x"8003" =>
					ram1_data_r <= ram1_data_3;
				when x"8004" =>
					ram1_data_r <= ram1_data_4;
				when x"8005" =>
					ram1_data_r <= ram1_data_5;
				when x"8006" =>
					ram1_data_r <= ram1_data_6;
				when x"8007" =>
					ram1_data_r <= ram1_data_7;
				when x"8008" =>
					ram1_data_r <= ram1_data_8;
				when x"8009" =>
					ram1_data_r <= ram1_data_9;
				when x"800A" =>
					ram1_data_r <= ram1_data_10;
				when others =>
					ram1_data_r <= x"0000";
			end case;
		end if;

	end process;

	process(ram1_en, ram1_we)
	begin
		if (ram1_en = '1') then
--			ram1_data_0 <= x"0000";
--			ram1_data_1 <= x"0000";
--			ram1_data_2 <= x"0000";
--			ram1_data_3 <= x"0000";
--			ram1_data_4 <= x"0000";
--			ram1_data_5 <= x"0000";
--			ram1_data_6 <= x"0000";
--			ram1_data_7 <= x"0000";
--			ram1_data_8 <= x"0000";
--			ram1_data_9 <= x"0000";
--			ram1_data_10 <= x"0000";
		elsif (rising_edge(ram1_we)) then
			if (ram1_oe = '1') then
			case ram1_addr is
				when x"8000" =>
					ram1_data_0 <= ram1_data_w; 	
				when x"8001" =>
					ram1_data_1 <= ram1_data_w; 	
				when x"8002" =>
					ram1_data_2 <= ram1_data_w;
				when x"8003" =>
					ram1_data_3 <= ram1_data_w;
				when x"8004" =>
					ram1_data_4 <= ram1_data_w;
				when x"8005" =>
					ram1_data_5 <= ram1_data_w;
				when x"8006" =>
					ram1_data_6 <= ram1_data_w;
				when x"8007" =>
					ram1_data_7 <= ram1_data_w;
				when x"8008" =>
					ram1_data_8 <= ram1_data_w;
				when x"8009" =>
					ram1_data_9 <= ram1_data_w;
				when x"800A" =>
					ram1_data_10 <= ram1_data_w;
				when others =>
			end case;
			else 
			end if;
		end if;
	end process;

end Behavioral;

