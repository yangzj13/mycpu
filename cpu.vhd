----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:23:58 11/21/2016 
-- Design Name: 
-- Module Name:    cpu - Behavioral 
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

entity cpu is
    Port ( 
    	rst : in  STD_LOGIC;
        clk : in  STD_LOGIC;
		
		--ram1
		ram1_en : out STD_LOGIC;
		ram1_we : out STD_LOGIC;
		ram1_oe : out STD_LOGIC;
		ram1_addr : out STD_LOGIC_VECTOR(15 downto 0);
		ram1_data : in STD_LOGIC_VECTOR(15 downto 0);
		-- ram1_data : inout STD_LOGIC_VECTOR(15 downto 0);
		
		-- ram2
		ram2_en : out STD_LOGIC;
		ram2_we : out STD_LOGIC;
		ram2_oe : out STD_LOGIC;
		ram2_addr : out STD_LOGIC_VECTOR(15 downto 0);
		ram2_data : in STD_LOGIC_VECTOR(15 downto 0)
		-- ram2_data : inout STD_LOGIC_VECTOR(15 downto 0)
		);
end cpu;

architecture Behavioral of cpu is

	--PC寄存器
	component pc_reg
		port(
			rst : in STD_LOGIC;
			clk : in STD_LOGIC;
			pc_i : in STD_LOGIC_VECTOR(15 downto 0);
			pc_o : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	--PC加1
	component pc_adder
		port(
			pc_i : in STD_LOGIC_VECTOR(15 downto 0);
			pc_o : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	--指令MEM控制器
	component inst_mem
		port(
			rst : in STD_LOGIC;
			clk : in STD_LOGIC;

			inst_addr_i : in STD_LOGIC_VECTOR(15 downto 0);
			inst_i : in STD_LOGIC_VECTOR(15 downto 0);
			inst_o : out STD_LOGIC_VECTOR(15 downto 0);
			ram2_en : out STD_LOGIC;
			ram2_we : out STD_LOGIC;
			ram2_oe : out STD_LOGIC;
			ram2_addr : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;
	
	--IF/ID段寄存器
	component if_id
		port(
			rst : in STD_LOGIC;
			clk : in STD_LOGIC;
			if_pc : in STD_LOGIC_VECTOR(15 downto 0);
			if_inst : in STD_LOGIC_VECTOR(15 downto 0);
			id_pc : out STD_LOGIC_VECTOR(15 downto 0);
			id_inst : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	--寄存器堆
	component registers
		port(
			-- 地址扩展为4位，用来表示特殊寄存器
			
			rst : in STD_LOGIC;
			clk : in STD_LOGIC;
			-- 读寄存器
			readAddr1 : in std_logic_vector(3 downto 0);
			readAddr2 : in std_logic_vector(3 downto 0);
			readData1 : out std_logic_vector(15 downto 0);
			readData2 : out std_logic_vector(15 downto 0);
			-- 写寄存器	  
			WbReg : in std_logic_vector(3 downto 0);
			WbData : in std_logic_vector(15 downto 0);
			WriteBack : in std_logic
		);
	end component;
	
	--控制器元件例化
	component controller
		port(
			rst : in STD_LOGIC;
			pc_i : in STD_LOGIC_VECTOR(15 downto 0);
			inst_i : in STD_LOGIC_VECTOR(15 downto 0);
			-- registers addr
			reg1_addr_o : out STD_LOGIC_VECTOR(3 downto 0);
			reg2_addr_o : out STD_LOGIC_VECTOR(3 downto 0);
			-- controll signals
			mem_to_reg : out STD_LOGIC; --直接写入寄存器(0)/读取RAM(1)
			reg_write : out STD_LOGIC; --是否写入寄存器
			reg_dst : out STD_LOGIC_VECTOR(3 downto 0); -- 目的寄存器地址（扩展为4位）
			alu_op : out STD_LOGIC_VECTOR(3 downto 0);
			extend_o : out STD_LOGIC_VECTOR(3 downto 0);
			a_src_o : out STD_LOGIC_VECTOR(1 downto 0);
			b_src_o : out STD_LOGIC_VECTOR(1 downto 0)
			-- TODO: other controll signals
		);
	end component;
	
	component extend
		port(
			extend_i : in STD_LOGIC_VECTOR(3 downto 0);
			inst_i : in STD_LOGIC_VECTOR(15 downto 0);
			imm_o : out STD_LOGIC_VECTOR(15 downto 0)
			);
	end component;

	component src_mux
		port(
			a_src_i : in STD_LOGIC_VECTOR(1 downto 0);
			b_src_i : in STD_LOGIC_VECTOR(1 downto 0);
			pc_i : in STD_LOGIC_VECTOR(15 downto 0);
			rx_i : in STD_LOGIC_VECTOR(15 downto 0);
			ry_i : in STD_LOGIC_VECTOR(15 downto 0);
			imm_i : in STD_LOGIC_VECTOR(15 downto 0);
			a_o : out STD_LOGIC_VECTOR(15 downto 0);
			b_o : out STD_LOGIC_VECTOR(15 downto 0)
			);
	end component;

	-- ID/EX段寄存器元件例化
	component id_ex
		port(
			rst : in STD_LOGIC;
			clk : in STD_LOGIC;
			-- ID
			id_rx : in STD_LOGIC_VECTOR(15 downto 0);
			id_ry : in STD_LOGIC_VECTOR(15 downto 0);
			id_rx_addr : in STD_LOGIC_VECTOR(3 downto 0);
			id_ry_addr : in STD_LOGIC_VECTOR(3 downto 0);
			id_mem_to_reg : in STD_LOGIC; --直接写入寄存器(0)/读取RAM(1)
			id_reg_write : in STD_LOGIC; --是否写入寄存器
			id_reg_dst : in STD_LOGIC_VECTOR(3 downto 0); -- 目的寄存器地址（扩展为4位）
			id_alu_op : in STD_LOGIC_VECTOR(3 downto 0);
			-- EX
			ex_rx : out STD_LOGIC_VECTOR(15 downto 0);
			ex_ry : out STD_LOGIC_VECTOR(15 downto 0);
			ex_rx_addr : out STD_LOGIC_VECTOR(3 downto 0);
			ex_ry_addr : out STD_LOGIC_VECTOR(3 downto 0);
			ex_mem_to_reg : out STD_LOGIC; --直接写入寄存器(0)/读取RAM(1)
			ex_reg_write : out STD_LOGIC; --是否写入寄存器
			ex_reg_dst : out STD_LOGIC_VECTOR(3 downto 0); -- 目的寄存器地址（扩展为4位）
			ex_alu_op : out STD_LOGIC_VECTOR(3 downto 0)	
		);
	end component;
	
	component forward_mux
		port(
			origin_data_in : in STD_LOGIC_VECTOR(15 downto 0);
			forward_data_in : in STD_LOGIC_VECTOR(15 downto 0);
			select_forward_data : in STD_LOGIC;
			data_out : out STD_LOGIC_VECTOR(15 downto 0)
			);
	end component;

	component alu
		port(
			rst : in STD_LOGIC;
			rx_i : in STD_LOGIC_VECTOR(15 downto 0);
			ry_i : in STD_LOGIC_VECTOR(15 downto 0);
			alu_op_i : in STD_LOGIC_VECTOR(3 downto 0);
			result_o : out STD_LOGIC_VECTOR(15 downto 0);
			flag_o : out STD_LOGIC_VECTOR(3 downto 0)
		);
	end component;
	
	component ex_mem
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
	end component;
	
	component data_mem
		port(
		
			rst : in STD_LOGIC;
			clk : in STD_LOGIC;

			mem_to_reg : in STD_LOGIC;
			
			addr_i : in STD_LOGIC_VECTOR(15 downto 0);
			data_i : in STD_LOGIC_VECTOR(15 downto 0);
			data_o : out STD_LOGIC_VECTOR(15 downto 0);
			
			ram1_en : out STD_LOGIC;
			ram1_we : out STD_LOGIC;
			ram1_oe : out STD_LOGIC;
			ram1_addr : out STD_LOGIC_VECTOR(15 downto 0);
			ram1_data : in STD_LOGIC_VECTOR(15 downto 0)

			-- ram1_data : inout STD_LOGIC_VECTOR(15 downto 0);

			--ram2_en : out STD_LOGIC;
			--ram2_we : out STD_LOGIC;
			--ram2_oe : out STD_LOGIC;
			--ram2_addr : out STD_LOGIC_VECTOR(15 downto 0);
			--ram2_data : in STD_LOGIC_VECTOR(15 downto 0)
			-- ram2_data : inout STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;
	
	component mem_wb
		port(
			rst : in STD_LOGIC;
			clk : in STD_LOGIC;
			mem_wdata : in STD_LOGIC_VECTOR(15 downto 0);
			mem_reg_dst : in STD_LOGIC_VECTOR(3 downto 0);
			mem_reg_write : in STD_LOGIC; --是否写入寄存器

			wb_wdata : out STD_LOGIC_VECTOR(15 downto 0);
			wb_reg_dst : out STD_LOGIC_VECTOR(3 downto 0);
			wb_reg_write : out STD_LOGIC --是否写入寄存器
		);
	end component;
	
	component forwarding_unit
		Port ( 
			rst : in STD_LOGIC;
			mem_data : in  STD_LOGIC_VECTOR (15 downto 0);
           	mem_reg : in  STD_LOGIC_VECTOR (3 downto 0);
			  
           	wb_data : in  STD_LOGIC_VECTOR (15 downto 0);
           	wb_reg : in  STD_LOGIC_VECTOR (3 downto 0);
           
			rx_cur : in  STD_LOGIC_VECTOR (3 downto 0);
           	ry_cur : in  STD_LOGIC_VECTOR (3 downto 0);
           
			data_A : out  STD_LOGIC_VECTOR (15 downto 0);
           	data_B : out  STD_LOGIC_VECTOR (15 downto 0);
           	select_data_A : out  STD_LOGIC;
           	select_data_B : out  STD_LOGIC);
	end component;

	-- pc_reg
	signal pc_out : STD_LOGIC_VECTOR(15 downto 0);
	-- pc_adder
	signal pc_plus_1 : STD_LOGIC_VECTOR(15 downto 0);
	-- inst_mem
	signal inst_out : STD_LOGIC_VECTOR(15 downto 0);
	-- if/id
	signal id_pc : STD_LOGIC_VECTOR(15 downto 0);
	signal id_inst : STD_LOGIC_VECTOR(15 downto 0);
	-- controller
	signal mem_to_reg_o : STD_LOGIC;
	signal alu_op_o : STD_LOGIC_VECTOR(3 downto 0);
	signal reg_dst_o : STD_LOGIC_VECTOR(3 downto 0);
	signal reg_write_o : STD_LOGIC;
	signal reg1_addr_o : STD_LOGIC_VECTOR(3 downto 0);
	signal reg2_addr_o : STD_LOGIC_VECTOR(3 downto 0);
	signal a_src_o : STD_LOGIC_VECTOR(1 downto 0);
	signal b_src_o : STD_LOGIC_VECTOR(1 downto 0);
	signal extend_o : STD_LOGIC_VECTOR(3 downto 0);
	
	-- registers
	signal r1_data : STD_LOGIC_VECTOR(15 downto 0);
	signal r2_data : STD_LOGIC_VECTOR(15 downto 0);

	-- extend
	signal imm_o : STD_LOGIC_VECTOR(15 downto 0);

	-- src_mux
	signal a_o : STD_LOGIC_VECTOR(15 downto 0);
	signal b_o : STD_LOGIC_VECTOR(15 downto 0);

	--id/ex
	signal ex_rx : STD_LOGIC_VECTOR(15 downto 0);
	signal ex_ry : STD_LOGIC_VECTOR(15 downto 0);
	signal ex_rx_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal ex_ry_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal ex_mem_to_reg : STD_LOGIC;
	signal ex_alu_op : STD_LOGIC_VECTOR(3 downto 0);
	signal ex_reg_dst : STD_LOGIC_VECTOR(3 downto 0);
	signal ex_reg_write : STD_LOGIC;

	--forward_mux
	signal mux_a : STD_LOGIC_VECTOR(15 downto 0);
	signal mux_b : STD_LOGIC_VECTOR(15 downto 0);

	--alu
	signal result_o : STD_LOGIC_VECTOR(15 downto 0); 
	signal flag_o : STD_LOGIC_VECTOR(3 downto 0);
	--ex/mem
	signal mem_mem_to_reg : STD_LOGIC; --直接写入寄存器(0)/读取RAM(1)
	signal mem_reg_write : STD_LOGIC; --是否写入寄存器
	signal mem_reg_dst : STD_LOGIC_VECTOR(3 downto 0); -- 目的寄存器地址（扩展为4位）
	signal mem_result : STD_LOGIC_VECTOR(15 downto 0);

	--data memory controller
	signal data_o : STD_LOGIC_VECTOR(15 downto 0);
	
	--mem/wb
	signal wb_wdata : STD_LOGIC_VECTOR(15 downto 0);
	signal wb_reg_dst : STD_LOGIC_VECTOR(3 downto 0);
	signal wb_reg_write : STD_LOGIC; --是否写入寄存器
	
	--forwarding_unit
	signal forward_data_a : STD_LOGIC_VECTOR(15 downto 0);
	signal forward_data_b : STD_LOGIC_VECTOR(15 downto 0);
	signal forward_sel_a : STD_LOGIC;
	signal forward_sel_b : STD_LOGIC;
	
begin
	
	u_pc_reg : pc_reg
	port map(	
		rst => rst,
		clk => clk,
		pc_i => pc_plus_1,
		pc_o => pc_out
	);

	u_pc_adder : pc_adder
	port map(
		pc_i => pc_out,
		pc_o => pc_plus_1
	);

	u_inst_mem : inst_mem
	port map(
		rst => rst,
		clk => clk,
		inst_addr_i => pc_out,
		inst_i => ram2_data,
		inst_o => inst_out,
		ram2_en => ram2_en,
		ram2_we => ram2_we,
		ram2_oe => ram2_oe,
		ram2_addr => ram2_addr
	);

	u_if_id : if_id
	port map(
		rst => rst,
		clk => clk,
		if_pc => pc_out,
		if_inst => inst_out,
		id_pc => id_pc,
		id_inst => id_inst
		);

	u_registers : registers
	port map(
		rst => rst,
		clk => clk,
		readAddr1 => reg1_addr_o,
		readAddr2 => reg2_addr_o,
		readData1 => r1_data,
		readData2 => r2_data,
		WriteBack => wb_reg_write,
		WbData => wb_wdata,
		WbReg => wb_reg_dst
		);

	u_controller : controller
	port map(
		rst => rst,
		pc_i => id_pc,
		inst_i => id_inst,
		mem_to_reg => mem_to_reg_o,
		reg_write => reg_write_o,
		reg_dst => reg_dst_o,
		alu_op => alu_op_o,
		extend_o => extend_o,
		a_src_o => a_src_o,
		b_src_o => b_src_o,
		reg1_addr_o => reg1_addr_o,
		reg2_addr_o => reg2_addr_o
		);

	u_extend : extend
	port map(
		extend_i => extend_o,
		inst_i => id_inst,
		imm_o => imm_o
		);

	u_src_mux : src_mux
	port map(
		a_src_i => a_src_o,
		b_src_i => b_src_o, 
		pc_i => id_pc,
		rx_i => r1_data,
		ry_i => r2_data,
		imm_i => imm_o,
		a_o => a_o,
		b_o => b_o
	);

	u_id_ex : id_ex
	port map(
		rst => rst,
		clk => clk,
		id_rx => a_o,
		id_ry => b_o,
		id_rx_addr => reg1_addr_o,
		id_ry_addr => reg2_addr_o,
		id_mem_to_reg => mem_to_reg_o,
		id_reg_write => reg_write_o,
		id_reg_dst => reg_dst_o,
		id_alu_op => alu_op_o,
		ex_rx => ex_rx,
		ex_ry => ex_ry,
		ex_rx_addr => ex_rx_addr,
		ex_ry_addr => ex_ry_addr,
		ex_mem_to_reg => ex_mem_to_reg,
		ex_reg_write => ex_reg_write,
		ex_reg_dst => ex_reg_dst,
		ex_alu_op => ex_alu_op
		);

	u_forward_mux_a : forward_mux
	port map(
			origin_data_in => ex_rx,
			forward_data_in => forward_data_a,
			select_forward_data => forward_sel_a,
			data_out => mux_a
		);

	u_forward_mux_b : forward_mux
	port map(
			origin_data_in => ex_ry,
			forward_data_in => forward_data_b,
			select_forward_data => forward_sel_b,
			data_out => mux_b
		);

	u_alu : alu
	port map(
		rst => rst,
		rx_i => mux_a,
		ry_i => mux_b,
		alu_op_i => ex_alu_op,
		result_o => result_o,
		flag_o => flag_o
		);

	u_ex_mem : ex_mem
	port map(
		rst => rst,
		clk => clk,
		ex_mem_to_reg => ex_mem_to_reg,
		ex_reg_write => ex_reg_write,
		ex_reg_dst => ex_reg_dst,
		ex_result => result_o,
		mem_mem_to_reg => mem_mem_to_reg,
		mem_reg_write => mem_reg_write,
		mem_reg_dst => mem_reg_dst,
		mem_result => mem_result
		);

	u_data_mem : data_mem
	port map(
		rst => rst,
		clk => clk,

		mem_to_reg => mem_mem_to_reg,
			
		addr_i => mem_result,
		data_i => mem_result,
		data_o => data_o,
		
		ram1_en => ram1_en,
		ram1_we => ram1_we,
		ram1_oe => ram1_oe,
		ram1_addr => ram1_addr,
		ram1_data => ram1_data

		--ram2_en => ram2_en,
		--ram2_we => ram2_we,
		--ram2_oe => ram2_oe,
		--ram2_addr => ram2_addr,
		--ram2_data => ram2_data
		);

	u_mem_wb : mem_wb
	port map(
		rst => rst,
		clk => clk,
		mem_wdata => data_o,
		mem_reg_dst => mem_reg_dst,
		mem_reg_write => mem_reg_write, 

		wb_wdata => wb_wdata,
		wb_reg_dst => wb_reg_dst,
		wb_reg_write => wb_reg_write
		);

	u_forwarding_unit : forwarding_unit
	port map(
		rst => rst,
		mem_data => mem_result,
		mem_reg => mem_reg_dst,
		wb_data => wb_wdata,
		wb_reg => wb_reg_dst,
		rx_cur => ex_rx_addr,
		ry_cur => ex_ry_addr,
		data_A => forward_data_a,
		data_B => forward_data_b,
		select_data_A => forward_sel_a,
		select_data_B => forward_sel_b
		);
end Behavioral;

