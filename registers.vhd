----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:17:02 11/22/2016 
-- Module Name:    registers - Behavioral 
-- Description: 
-- 寄存器堆，通用寄存器和特殊寄存器的存储元件部分
-- 
-- 寄存器的编码如下：
-- 1000 通用寄存器0
-- 1001 通用寄存器1
-- 1010 通用寄存器2
-- 1011 通用寄存器3
-- 1100 通用寄存器4
-- 1101 通用寄存器5
-- 1110 通用寄存器6
-- 1111 通用寄存器7
-- 0000 NOP语句，输出全0即可
-- 0001 T寄存器
-- 0010 IH寄存器
-- 0011 RA寄存器
-- 0100 SP寄存器
-- 
--端口说明：
--clk   时钟信号
--rst   reset信号
--readReg1 		暂时没有使用
--readReg2 		暂时没有使用
--readAddr1 	所读取的寄存器1
--readAddr2 	所读取的寄存器2	  
--WbReg 			写入的目标寄存器
--WbData 		写入的数据
--WriteBack 	写使能信号
--readData1 	读取寄存器1得到的数据
--readData2 	读取寄存器2得到的数据
--
--记录：
--读取两个寄存器与写寄存器为并行，process在运行上是否会出现什么问题暂不清楚
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
	
	--读取寄存器1的值
	process(WriteBack, readAddr1)
	begin
		--如果读寄存器时，同时也正在进行写操作，那将写进来的值直接传给readData1
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
	
	--读取寄存器2的值
	process(WriteBack, readAddr2)
	begin
	--如果读寄存器时，这个地址同时也正在进行写操作，那将写进来的值直接传给readData2
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
	
	--将数据写入寄存器
	process(clk, rst)
	begin
		-- 触发rst时将全部清零
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
			--clk触发并且写使能为1时，将数据写入目标寄存器
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

