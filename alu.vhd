----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:03:39 11/22/2016 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity alu is
    Port ( alu_op_i : in  STD_LOGIC_VECTOR (3 downto 0);
			  rx_i : in  STD_LOGIC_VECTOR (15 downto 0);
           ry_i : in  STD_LOGIC_VECTOR (15 downto 0);
           result_o : out  STD_LOGIC_VECTOR (15 downto 0);
			  flag_o : out STD_LOGIC_VECTOR(3 downto 0);
			  rst : in STD_LOGIC
			  );
end alu;

architecture Behavioral of alu is

	signal C: std_logic:='0';
	signal Z: std_logic:='0';
	signal S: std_logic:='0';
	signal O: std_logic:='0';
begin
	process(rx_i,ry_i,alu_op_i,rst)
	variable t : std_logic_vector(15 downto 0);
	variable result0 :std_logic_vector(16 downto 0);
	begin
		if (rst = '0') then
			result_o <= x"0000";
			flag_o <= "0000";
		else
		case alu_op_i is
			when "0000"=>	t := rx_i + ry_i;
								result_o <= rx_i + ry_i;
								--CF
								result0 := ("0"&rx_i)+("0"&ry_i);
								C<=result0(16);
								--ZF
								if (t="0000000000000000") then
									Z<='1';
								else
									Z<='0';
								end if;
								--SF
								if (t(15)='1') then
									S<='1';
								else
									S<='0';
								end if;
								--OF
								if((rx_i(15)='0')AND(ry_i(15)='0')AND(t(15)='1'))then
									O<='1';
								elsif((rx_i(15)='1')AND(ry_i(15)='1')AND(t(15)='0'))then
									O<='1';
								else
									O<='0';
								end if;
			when "0001"=> 	t := rx_i - ry_i;
								result_o<=rx_i - ry_i;
								--CF
								result0 := ("0"&rx_i)-("0"&ry_i);
								C<=result0(16);
								--ZF
								if (t="0000000000000000") then
									Z<='1';
								else
									Z<='0';
								end if;
								--SF
								if (t(15)='1') then
									S<='1';
								else
									S<='0';
								end if;
								--OF
								if((rx_i(15)='0')AND(ry_i(15)='1')AND(t(15)='1'))then
									O<='1';
								elsif((rx_i(15)='1')AND(ry_i(15)='0')AND(t(15)='0'))then
									O<='1';
								else
									O<='0';
								end if;
			when "0010"=> result_o <= rx_i and ry_i;
			when "0011"=> result_o <= rx_i or ry_i;
			when "0100"=> result_o <= rx_i xor ry_i;
			when "0101"=> result_o <= not rx_i;
			when "0110"=> result_o <= to_stdlogicvector(to_bitvector(rx_i) sll conv_integer(ry_i));
			when "0111"=> result_o <= to_stdlogicvector(to_bitvector(rx_i) srl conv_integer(ry_i));
			when "1000"=> result_o <= to_stdlogicvector(to_bitvector(rx_i) sra conv_integer(ry_i));
			when "1001"=> result_o <= to_stdlogicvector(to_bitvector(rx_i) rol conv_integer(ry_i));
			when others=> result_o <= "0000000000000000";
		end case;	
		flag_o(3)<=C;
		flag_o(2)<=Z;
		flag_o(1)<=S;
		flag_o(0)<=O;
		end if;
	end process;
end Behavioral;

