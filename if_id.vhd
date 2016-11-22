----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:23:08 11/22/2016 
-- Design Name: 
-- Module Name:    if_id - Behavioral 
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

entity if_id is
	port(
		rst : in STD_LOGIC;
		clk : in STD_LOGIC;
		if_pc : in STD_LOGIC_VECTOR(15 downto 0);
		if_inst : in STD_LOGIC_VECTOR(15 downto 0);
		id_pc : out STD_LOGIC_VECTOR(15 downto 0);
		id_inst : out STD_LOGIC_VECTOR(15 downto 0)
	);
end if_id;

architecture Behavioral of if_id is
begin
	process(clk, rst)
	begin
		if rst = '0' then
			id_pc <= x"0000";
			id_inst <= x"0000";
		elsif clk'event and clk = '1' then
			id_pc <= if_pc;
			id_inst <= if_inst;
		end if;
	end process;
end Behavioral;

