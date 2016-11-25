----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:51:29 11/24/2016 
-- Design Name: 
-- Module Name:    lw_stall_detect - Behavioral 
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

entity lw_stall_detect is
    Port ( reg_1 : in  STD_LOGIC_VECTOR (3 downto 0);
           reg_2 : in  STD_LOGIC_VECTOR (3 downto 0);
           reg_w : in  STD_LOGIC_VECTOR (3 downto 0);
           mem_read : in  STD_LOGIC;
           stall_req_lw : out  STD_LOGIC);
end lw_stall_detect;

architecture Behavioral of lw_stall_detect is

begin

process(reg_1, reg_2, reg_w, mem_read)
begin
	if (mem_read = '1') and (reg_w /= "0000") then
		if (reg_1 = reg_w) or (reg_2 = reg_w) then
			stall_req_lw <= '1';
		else 
			stall_req_lw <= '0';
		end if;
	else 
		stall_req_lw <= '0';
	end if;
end process;

end Behavioral;

