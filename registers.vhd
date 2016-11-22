----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:17:02 11/22/2016 
-- Module Name:    registers - Behavioral 
-- Description: 
-- �Ĵ����ѣ�ͨ�üĴ���������Ĵ����Ĵ洢Ԫ������
-- 
-- �Ĵ����ı������£�
-- 1000 ͨ�üĴ���0
-- 1001 ͨ�üĴ���1
-- 1010 ͨ�üĴ���2
-- 1011 ͨ�üĴ���3
-- 1100 ͨ�üĴ���4
-- 1101 ͨ�üĴ���5
-- 1110 ͨ�üĴ���6
-- 1111 ͨ�üĴ���7
-- 0000 NOP��䣬���ȫ0����
-- 0001 T�Ĵ���
-- 0010 IH�Ĵ���
-- 0011 RA�Ĵ���
-- 0100 SP�Ĵ���
-- 
--�˿�˵����
--clk   ʱ���ź�
--rst   reset�ź�
--readReg1 		��ʱû��ʹ��
--readReg2 		��ʱû��ʹ��
--readAddr1 	����ȡ�ļĴ���1
--readAddr2 	����ȡ�ļĴ���2	  
--WbReg 			д���Ŀ��Ĵ���
--WbData 		д�������
--WriteBack 	дʹ���ź�
--readData1 	��ȡ�Ĵ���1�õ�������
--readData2 	��ȡ�Ĵ���2�õ�������
--
--��¼��
--��ȡ�����Ĵ�����д�Ĵ���Ϊ���У�process���������Ƿ�����ʲô�����ݲ����
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

entity registers is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  
			  readAddr1 : in std_logic_vector(3 downto 0);
			  readAddr2 : in std_logic_vector(3 downto 0);
			  
			  WbReg : in std_logic_vector(3 downto 0);
			  WbData : in std_logic_vector(15 downto 0);
			  WriteBack : in std_logic;
			  
			  readData1 : out std_logic_vector(15 downto 0);
			  readData2 : out std_logic_vector(15 downto 0));
end registers;

architecture Behavioral of registers is

	signal r0 : std_logic_vector(15 downto 0);
	signal r1 : std_logic_vector(15 downto 0);
	signal r2 : std_logic_vector(15 downto 0);
	signal r3 : std_logic_vector(15 downto 0);
	signal r4 : std_logic_vector(15 downto 0);
	signal r5 : std_logic_vector(15 downto 0);
	signal r6 : std_logic_vector(15 downto 0);
	signal r7 : std_logic_vector(15 downto 0);
	signal T  : std_logic_vector(15 downto 0);
	signal IH : std_logic_vector(15 downto 0);
	signal RA : std_logic_vector(15 downto 0);
	signal SP : std_logic_vector(15 downto 0);
	
begin
	
	--��ȡ�Ĵ���1��ֵ
	process(WriteBack, readAddr1)
	begin
		--������Ĵ���ʱ��ͬʱҲ���ڽ���д�������ǽ�д������ֱֵ�Ӵ���readData1
		if(WriteBack = '1' and (readAddr1 = WbReg)) then
			readData1 <= WbData;
		else
			case readAddr1 is 
				when "1000" => readData1 <= r0;
				when "1001" => readData1 <= r1;
				when "1010" => readData1 <= r2;
				when "1011" => readData1 <= r3;
				when "1100" => readData1 <= r4;
				when "1101" => readData1 <= r5;
				when "1110" => readData1 <= r6;
				when "1111" => readData1 <= r7;
				when "0001" => readData1 <= T;
				when "0010" => readData1 <= IH;
				when "0011" => readData1 <= RA;
				when "0100" => readData1 <= SP;
				when others => readData1 <= (others => '0');
			end case;
		end if;
	end process;
	
	--��ȡ�Ĵ���2��ֵ
	process(WriteBack, readAddr2)
	begin
	--������Ĵ���ʱ�������ַͬʱҲ���ڽ���д�������ǽ�д������ֱֵ�Ӵ���readData2
		if(WriteBack = '1' and (readAddr2 = WbReg)) then
			readData2 <= WbData;
		else
			case readAddr2 is 
				when "1000" => readData2 <= r0;
				when "1001" => readData2 <= r1;
				when "1010" => readData2 <= r2;
				when "1011" => readData2 <= r3;
				when "1100" => readData2 <= r4;
				when "1101" => readData2 <= r5;
				when "1110" => readData2 <= r6;
				when "1111" => readData2 <= r7;
				when "0001" => readData2 <= T;
				when "0010" => readData2 <= IH;
				when "0011" => readData2 <= RA;
				when "0100" => readData2 <= SP;
				when others => readData2 <= (others => '0');
			end case;
		end if;
	end process;
	
	--������д��Ĵ���
	process(clk, rst)
	begin
		-- ����rstʱ��ȫ������
		if (rst = '0') then
			r0 <= (others => '0');
			r1 <= (others => '0');
			r2 <= (others => '0');
			r3 <= (others => '0');
			r4 <= (others => '0');
			r5 <= (others => '0');
			r6 <= (others => '0');
			r7 <= (others => '0');
			T  <= (others => '0');
			IH <= (others => '0');	
			RA <= (others => '0');
			SP <= (others => '0');
			--clk��������дʹ��Ϊ1ʱ��������д��Ŀ��Ĵ���
		elsif (clk'event and clk = '0' and WriteBack = '1') then	
			case WbReg is 
				when "1000" => r0 <= WbData;
				when "1001" => r1 <= WbData;
				when "1010" => r2 <= WbData;
				when "1011" => r3 <= WbData;
				when "1100" => r4 <= WbData;
				when "1101" => r5 <= WbData;
				when "1110" => r6 <= WbData;
				when "1111" => r7 <= WbData;
				when "0001" => T  <= WbData;
				when "0010" => IH <= WbData;
				when "0011" => RA <= WbData;
				when "0100" => SP <= WbData;
				when others =>
			end case;
		end if;
	end process;

end Behavioral;

