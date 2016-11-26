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

entity ex_mem is
	port(
		rst : in STD_LOGIC;
		clk : in STD_LOGIC;
		-- EXE
		ex_mem_to_reg : in STD_LOGIC; --ֱ��д��Ĵ���(0)/��ȡRAM(1)
		ex_reg_write : in STD_LOGIC; --�Ƿ�д��Ĵ���
		ex_reg_dst : in STD_LOGIC_VECTOR(3 downto 0); -- Ŀ�ļĴ�����ַ����չΪ4λ��
		ex_result : in STD_LOGIC_VECTOR(15 downto 0);
		ex_sw_reg_addr : in STD_LOGIC_VECTOR(3 downto 0);
		ex_mem_read : in STD_LOGIC;
		ex_mem_write : in STD_LOGIC;
		-- MEM
		mem_mem_to_reg : out STD_LOGIC; --ֱ��д��Ĵ���(0)/��ȡRAM(1)
		mem_reg_write : out STD_LOGIC; --�Ƿ�д��Ĵ���
		mem_reg_dst : out STD_LOGIC_VECTOR(3 downto 0); -- Ŀ�ļĴ�����ַ����չΪ4λ��
		mem_result : out STD_LOGIC_VECTOR(15 downto 0);
		mem_sw_reg_addr : out STD_LOGIC_VECTOR(3 downto 0);
		mem_mem_read : out STD_LOGIC;
		mem_mem_write : out STD_LOGIC
);
end ex_mem;

architecture Behavioral of ex_mem is
begin
	process(clk, rst)
	begin
		if rst = '0' then
			mem_mem_to_reg <= '0';
			mem_reg_write <= '0';
			mem_reg_dst <= "0000";
			mem_result <= x"0000";
			mem_sw_reg_addr <= "0000";
			mem_mem_read <= '0';
			mem_mem_write <= '0';
		elsif clk'event and clk = '1' then --ʱ��������
			mem_mem_to_reg <= ex_mem_to_reg;
			mem_reg_write <= ex_reg_write;
			mem_reg_dst <= ex_reg_dst;
			mem_result <= ex_result;
			mem_sw_reg_addr <= ex_sw_reg_addr;
			mem_mem_read <= ex_mem_read;
			mem_mem_write <= ex_mem_write;
		end if;		
	end process;
end Behavioral;

