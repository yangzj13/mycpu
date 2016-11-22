----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:58:20 11/21/2016 
-- Design Name: 
-- Module Name:    controller - Behavioral 
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

entity controller is
		port(
			rst : in STD_LOGIC;
			pc_i : in STD_LOGIC_VECTOR(15 downto 0);
			inst_i : in STD_LOGIC_VECTOR(15 downto 0);
			-- registers data
			reg1_data_i : in STD_LOGIC_VECTOR(15 downto 0);
			reg2_data_i : in STD_LOGIC_VECTOR(15 downto 0);
			rx_o : out STD_LOGIC_VECTOR(15 downto 0);
			ry_o : out STD_LOGIC_VECTOR(15 downto 0);
			-- registers addr
			reg1_addr_o : out STD_LOGIC_VECTOR(15 downto 0);
			reg2_addr_o : out STD_LOGIC_VECTOR(15 downto 0);
			-- controll signals
			mem_to_reg : out STD_LOGIC; --直接写入寄存器(0)/读取RAM(1)
			reg_write : out STD_LOGIC; --是否写入寄存器
			reg_dst : out STD_LOGIC_VECTOR(3 downto 0); -- 目的寄存器地址（扩展为4位）
			alu_op : out STD_LOGIC_VECTOR(3 downto 0)
			-- TODO: other controll signals
		);
end controller;

architecture Behavioral of controller is

begin


end Behavioral;

