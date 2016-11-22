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

entity mem_wb is
	port(
		rst : in STD_LOGIC;
		clk : in STD_LOGIC;
		mem_wdata : in STD_LOGIC_VECTOR(15 downto 0);
		mem_reg_dst : in STD_LOGIC_VECTOR(3 downto 0);
		mem_reg_write : in STD_LOGIC; --�Ƿ�д��Ĵ���

		wb_wdata : out STD_LOGIC_VECTOR(15 downto 0);
		wb_reg_dst : out STD_LOGIC_VECTOR(3 downto 0);
		wb_reg_write : out STD_LOGIC --�Ƿ�д��Ĵ���
);
end mem_wb;

architecture Behavioral of mem_wb is
begin
	process(clk, rst)
	begin
		if rst = '0' then
			wb_wdata <= x"0000";
			wb_reg_dst <= "0000";
			wb_reg_write <= '0';
		elsif clk'event and clk = '1' then --ʱ��������
			wb_wdata <= mem_wdata;
			wb_reg_dst <= mem_reg_dst;
			wb_reg_write <= mem_reg_write;
		end if;
	end process;
end Behavioral;

