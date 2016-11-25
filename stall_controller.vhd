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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stall_controller is
    Port ( stall_req_branch : in  STD_LOGIC;
			  stall_req_lw : in STD_LOGIC;
           stall_req_if : in  STD_LOGIC;
           stall_req_mem : in  STD_LOGIC;
           stall : out  STD_LOGIC_VECTOR (5 downto 0));
end stall_controller;

architecture Behavioral of stall_controller is

begin

process(stall_req_branch, stall_req_if, stall_req_lw, stall_req_mem)
variable stall_req : STD_LOGIC_VECTOR(3 downto 0);
begin
	stall_req(3) := stall_req_branch;
	stall_req(2) := stall_req_if;
	stall_req(1) := stall_req_lw;
	stall_req(0) := stall_req_mem;
	case stall_req is
		--branch
		when "1000" =>
			stall <= "000111";
		--IF
		when "0100" =>
			stall <= "000011";
		--lw
		when "0010" =>
			stall <= "000111";
		--mem
		when "0001" =>
			stall <= "011111";
		--multiple stall
		when others =>
			stall <= "111111";
	end case;
end process;

end Behavioral;

