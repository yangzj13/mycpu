----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:27:26 11/24/2016 
-- Design Name: 
-- Module Name:    stall_controller - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stall_controller is
    Port ( stall_req_branch : in  STD_LOGIC;
           stall_req_if : in  STD_LOGIC;
           id_reg1_addr : in STD_LOGIC_VECTOR(3 downto 0);
           id_reg2_addr : in STD_LOGIC_VECTOR(3 downto 0);
           ex_reg_dst : in STD_LOGIC_VECTOR(3 downto 0);
           ex_mem_read : in STD_LOGIC;
           mem_reg_dst : in STD_LOGIC_VECTOR(3 downto 0);
           mem_mem_read : in STD_LOGIC;

           stall : out  STD_LOGIC);
end stall_controller;

architecture Behavioral of stall_controller is
signal ex_stall : STD_LOGIC;
signal mem_stall : STD_LOGIC;

begin

process(stall_req_branch, stall_req_if, id_reg1_addr, id_reg2_addr, ex_reg_dst, ex_mem_read, mem_mem_read, mem_reg_dst)

begin
	if (ex_mem_read = '1') and (ex_reg_dst /= "0000") then
		if (id_reg1_addr = ex_reg_dst) or (id_reg2_addr = ex_reg_dst) then
			ex_stall <= '1';
		else 
			ex_stall <= '0';
		end if;
	else 
		ex_stall <= '0';
	end if;
	if (mem_mem_read = '1') and (mem_reg_dst /= "0000") then
		if (id_reg1_addr = mem_reg_dst) or (id_reg2_addr = mem_reg_dst) then
			mem_stall <= '1';
		else 
			mem_stall <= '0';
		end if;
	else 
		mem_stall <= '0';
	end if;
	stall <= stall_req_if or stall_req_branch or ex_stall or mem_stall;

	--if (stall_req_branch = '1') or (stall_req_if = '1') then
	--	stall <= '1';
	--elsif (ex_mem_read and ex_reg_dst = id_reg1_addr) then
	--	stall <= '1';
	--elsif (ex_mem_read and ex_reg_dst = id_reg2_addr) then
	--	stall <= '1';
	--elsif (mem_mem_read and mem_reg_dst = id_reg1_addr) then
	--	stall <= '1';
	--elsif  (mem_mem_read and mem_reg_dst = id_reg2_addr) then
	--	stall <= '1'; 
	--else 
	--	stall <= '0';
	--end if;
end process;

end Behavioral;

