----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:56:25 11/24/2016 
-- Design Name: 
-- Module Name:    io - Behavioral 
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

entity io is
    Port ( inst_addr : in  STD_LOGIC_VECTOR (15 downto 0);
           inst : out  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           r_addr : in  STD_LOGIC_VECTOR (15 downto 0);
           oe : in  STD_LOGIC;
           r_data : out  STD_LOGIC_VECTOR (15 downto 0);
           we : in  STD_LOGIC;
           w_addr : in  STD_LOGIC_VECTOR (15 downto 0);
           w_data : in  STD_LOGIC_VECTOR (15 downto 0);
           stall_req_if : out  STD_LOGIC;
           stall_req_mem : out  STD_LOGIC;
           data_ready : in  STD_LOGIC;
           tbre : in  STD_LOGIC;
           tsre : in  STD_LOGIC;
           rdn : inout  STD_LOGIC;
           wrn : inout  STD_LOGIC;
           ram1_en : out  STD_LOGIC;
           ram1_we : out  STD_LOGIC;
           ram1_oe : out  STD_LOGIC;
           ram1_addr : out  STD_LOGIC_VECTOR (17 downto 0);
           ram1_data : inout  STD_LOGIC_VECTOR (15 downto 0);
           ram2_en : out  STD_LOGIC;
           ram2_we : out  STD_LOGIC;
           ram2_oe : out  STD_LOGIC;
           ram2_addr : out  STD_LOGIC_VECTOR (17 downto 0);
           ram2_data : inout  STD_LOGIC_VECTOR (15 downto 0);
           digit1 : out  STD_LOGIC_VECTOR (6 downto 0);
           digit2 : out  STD_LOGIC_VECTOR (6 downto 0);
           led : out  STD_LOGIC_VECTOR (15 downto 0));
end io;

architecture Behavioral of io is

type states is ("init", "ram22mem", "ram12mem", "mem2ram1", "mem2ram2", "uart2mem", "mem2uart",
                "uart_w_2", "uart_w_3", "uart_w_4", "uart_w_5", "uart_r_2", "uart_r_3");
signal state : states;

begin

process(clk, rst)
begin

if (rst = '0') then
  state <= "init";
  inst <= x"0000";
  r_data <= x"0000";
  stall_req_if <= '0';
  stall_req_mem <= '0';
  ram1_en <= '1';
  ram1_oe <= '1';
  ram1_we <= '1';
  ram1_addr <= "00" & x"0000";
  ram2_en <= '1';
  ram2_oe <= '1';
  ram2_we <= '1';
  ram2_addr <= "00" & x"0000";
  digit1 <= "0000000";
  digit2 <= "0000000";
  led < x"0000";
elsif (rising_edge(clk)) then
  case state is
    when "init" =>
      --IF address in 0x0000~0x7FFF
      --MEM address in 0x0000~0x7FFF or 0x8000~0xBEFF or 0xC000~0xFFFF
      --RAM1 : 0x8000~0xBEFF and 0xC000~0xFFFF
      --RAM2 : 0x0000~0x7FFF
      --UART : 0xBF00~0xBFFF
      stall_req_if <= '0';
      stall_req_mem <= '0';
      if (oe = '0') --MEM READ from RAM1/2
        if (r_addr < x"0x8000") then --MEM READ from RAM2
          state <= "ram22mem";
          ram1_en <= '1';
          ram1_oe <= '1';
          ram1_we <= '1';
          ram1_addr <= "00" & x"0000";
          ram2_en <= '0';
          ram2_oe <= '0';
          ram2_we <= '1';
          ram2_addr <= "00" & r_addr;
          ram2_data <= "ZZZZZZZZZZZZZZZZ";
        elsif (r_addr(15 downto 8) = x"BF") then --MEM READ from UART
          state <= "uart2mem"
          ram1_en <= '1';
          ram1_oe <= '1';
          ram1_we <= '1';
          ram2_en <= '1';
          ram2_oe <= '1';
          ram2_we <= '1';
        else --MEM READ from RAM1
          state <= "ram12mem";
          ram1_en <= '0';
          ram1_oe <= '0';
          ram1_we <= '1';
          ram1_addr <= "00" & r_addr;
          ram1_data <= "ZZZZZZZZZZZZZZZZ";          
          ram2_en <= '0';
          ram2_oe <= '0';
          ram2_we <= '1';
          ram2_addr <= "00" & inst_addr;
          ram2_data <= "ZZZZZZZZZZZZZZZZ"
        end if;
      elsif (we = '0') --MEM WRITE to RAM1/2
        if (w_addr < x"0x8000") then --MEM write to RAM2
          state <= "mem2ram2"
          ram2_en <= '0';
          ram2_oe <= '1';
          ram2_we <= '0';
          ram2_addr <= w_addr;
        elsif (w_addr(15 downto 8) = x"BF") then --MEM write to UART  
          state <= "mem2uart"

        else -- MEM write to RAM1
          state <= "mem2ram1"

        end if;
      else --MEM not read nor write
        state <= "init";
      end if;
    when "ram22mem" =>
      state <= "init";
      stall_req_if <= '1';
      r_data <= ram2_data;
      inst <= x"0000";
    when "ram12mem" =>
      state <= "init";
      r_data <= ram1_data;
      inst <= ram2_data;
    when "mem2ram1" =>

    when "mem2ram2" =>

    when "uart2mem" =>
      wrn <= '1';
      ram1_data <= "ZZZZZZZZZZZZZZZZ";
      inst <= x"0000";
      state <= "uart_r_2";
    when "uart_r_2" =>
      if (data_ready = '1') then
        rdn <= '0';
        state <= "uart_r_3";
      elsif (data_ready = '0') then
        state <= "uart2mem";
      end if;
    when "uart_r_3" =>
      r_data <= x"00" & ram1_data(7 downto 0);
      state <= "init";
    when "mem2uart" =>

    when others =>
  end case;
end if;

end process;

end Behavioral;

