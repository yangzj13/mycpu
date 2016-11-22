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
		ex_mem_to_reg : in STD_LOGIC; --直接写入寄存器(0)/读取RAM(1)
		ex_reg_write : in STD_LOGIC; --是否写入寄存器
		ex_reg_dst : in STD_LOGIC_VECTOR(3 downto 0); -- 目的寄存器地址（扩展为4位）
		ex_result : in STD_LOGIC_VECTOR(15 downto 0);
		-- MEM
		mem_mem_to_reg : out STD_LOGIC; --直接写入寄存器(0)/读取RAM(1)
		mem_reg_write : out STD_LOGIC; --是否写入寄存器
		mem_reg_dst : out STD_LOGIC_VECTOR(3 downto 0); -- 目的寄存器地址（扩展为4位）
		mem_result : out STD_LOGIC_VECTOR(15 downto 0)
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
		elsif clk'event and clk = '1' then --时钟上升沿
			mem_mem_to_reg <= ex_mem_to_reg;
			mem_reg_write <= ex_reg_write;
			mem_reg_dst <= ex_reg_dst;
			mem_result <= ex_result;
		end if;		
	end process;
end Behavioral;

