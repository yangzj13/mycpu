----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:22:58 11/22/2016 
-- Design Name: 
-- Module Name:    inst_mem - Behavioral 
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

entity inst_mem is
	port(
	rst : in STD_LOGIC;
	clk : in STD_LOGIC;

	inst_addr_i : in STD_LOGIC_VECTOR(15 downto 0);
	inst_i : in STD_LOGIC_VECTOR(15 downto 0);
	inst_o : out STD_LOGIC_VECTOR(15 downto 0);
	ram2_en : out STD_LOGIC;
	ram2_we : out STD_LOGIC;
	ram2_oe : out STD_LOGIC;
	ram2_addr : out STD_LOGIC_VECTOR(15 downto 0);
	ram2_data_o : out STD_LOGIC_VECTOR(15 downto 0);
	ram2_hr : out STD_LOGIC
);
end inst_mem;

architecture Behavioral of inst_mem is

begin

	process(rst ,inst_i, inst_addr_i)
	begin
		if (rst = '0') then
			ram2_en <= '1';
			ram2_we <= '1';
			ram2_oe <= '1';
			ram2_addr <= x"0000";
			--inst_i <= x"0000";
			inst_o <= x"0000";
		else
			ram2_addr <= inst_addr_i;
			ram2_we <= '1';
			ram2_oe <= '0';
			ram2_en <= '0';
			ram2_data_o <= (others => 'Z');
			ram2_hr <= '1';
			inst_o <= inst_i;
		end if;
	end process;

end Behavioral;

