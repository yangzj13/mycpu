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
        clk1x : in  STD_LOGIC;
		  clk11m : in STD_LOGIC;
		clk50m : in STD_LOGIC;
		--ram1
		ram1_en : out STD_LOGIC;
		ram1_we : out STD_LOGIC;
		ram1_oe : out STD_LOGIC;
		ram1_addr : out STD_LOGIC_VECTOR(15 downto 0);
		--ram1_data_r : in STD_LOGIC_VECTOR(15 downto 0);
		--ram1_data_w : out STD_LOGIC_VECTOR(15 downto 0);
		ram1_data : inout STD_LOGIC_VECTOR(15 downto 0);
		
		-- ram2
		ram2_en : out STD_LOGIC;
		ram2_we : out STD_LOGIC;
		ram2_oe : out STD_LOGIC;
		ram2_addr : out STD_LOGIC_VECTOR(15 downto 0);
		--ram2_data : in STD_LOGIC_VECTOR(15 downto 0)
		ram2_data : inout STD_LOGIC_VECTOR(15 downto 0);
		
		--COM
		tbre : in STD_LOGIC;
		tsre : in STD_LOGIC;
		wrn : out STD_LOGIC;
		rdn : out STD_LOGIC;
		data_ready : in STD_LOGIC;
		
		led : out STD_LOGIC_VECTOR(15 downto 0);
		digit1 : out STD_LOGIC_VECTOR(6 downto 0);
		digit2 : out STD_LOGIC_VECTOR(6 downto 0);
		KEYSET : in STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
end cpu;


architecture Behavioral of cpu is

	--PC寄存器
	component pc_reg
		port(
			rst : in STD_LOGIC;
			clk : in STD_LOGIC;
			stall : in STD_LOGIC;
			pc_i : in STD_LOGIC_VECTOR(15 downto 0);
			pc_o : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	--PC加1
	--component pc_adder
	--	port(
	--		pc_i : in STD_LOGIC_VECTOR(15 downto 0);
	--		pc_o : out STD_LOGIC_VECTOR(15 downto 0)
	--	);
	--end component;

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
			ram2_addr : out STD_LOGIC_VECTOR(15 downto 0);
			ram2_data_o : out STD_LOGIC_VECTOR(15 downto 0);
			ram2_hr : out STD_LOGIC;
			mem_read_en : in STD_LOGIC;
			mem_addr : in STD_LOGIC_VECTOR(15 downto 0);
			mem_write_en : in STD_LOGIC;
			mem_write_data : in STD_LOGIC_VECTOR(15 downto 0);
			stall_req_if : out STD_LOGIC
		);
	end component;
	
	--IF/ID段寄存器
	component if_id
		port(
			rst : in STD_LOGIC;
			clk : in STD_LOGIC;
			stall : in STD_LOGIC;
			if_pc : in STD_LOGIC_VECTOR(15 downto 0);
			if_inst : in STD_LOGIC_VECTOR(15 downto 0);
			id_pc : out STD_LOGIC_VECTOR(15 downto 0);
			id_inst : out STD_LOGIC_VECTOR(15 downto 0);
			clear_next_inst : in STD_LOGIC
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
			sw_reg_addr : in STD_LOGIC_VECTOR(3 DOWNTO 0);
			readData1 : out std_logic_vector(15 downto 0);
			readData2 : out std_logic_vector(15 downto 0);
			sw_reg_data : OUT std_logic_vector(15 downto 0);
			
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
			b_src_o : out STD_LOGIC_VECTOR(1 downto 0);
			res_flag_o : out STD_LOGIC_VECTOR(2 downto 0);
			branch_ctr_o : out STD_LOGIC_VECTOR(2 downto 0);
			mem_read : out STD_LOGIC;
			mem_write : out STD_LOGIC;
			sw_reg_addr : out STD_LOGIC_VECTOR(3 downto 0)
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
			stall : in STD_LOGIC;
			-- ID
			id_rx : in STD_LOGIC_VECTOR(15 downto 0);
			id_ry : in STD_LOGIC_VECTOR(15 downto 0);
			id_rx_addr : in STD_LOGIC_VECTOR(3 downto 0);
			id_ry_addr : in STD_LOGIC_VECTOR(3 downto 0);
			id_mem_to_reg : in STD_LOGIC; --直接写入寄存器(0)/读取RAM(1)
			id_reg_write : in STD_LOGIC; --是否写入寄存器
			id_reg_dst : in STD_LOGIC_VECTOR(3 downto 0); -- 目的寄存器地址（扩展为4位）
			id_alu_op : in STD_LOGIC_VECTOR(3 downto 0);
			id_res_flag : in STD_LOGIC_VECTOR(2 downto 0);
			id_sw_reg_addr : in STD_LOGIC_VECTOR(3 downto 0);
			id_mem_read :in STD_LOGIC;
			id_mem_write :in STD_LOGIC;

			-- EX
			ex_rx : out STD_LOGIC_VECTOR(15 downto 0);
			ex_ry : out STD_LOGIC_VECTOR(15 downto 0);
			ex_rx_addr : out STD_LOGIC_VECTOR(3 downto 0);
			ex_ry_addr : out STD_LOGIC_VECTOR(3 downto 0);
			ex_mem_to_reg : out STD_LOGIC; --直接写入寄存器(0)/读取RAM(1)
			ex_reg_write : out STD_LOGIC; --是否写入寄存器
			ex_reg_dst : out STD_LOGIC_VECTOR(3 downto 0); -- 目的寄存器地址（扩展为4位）
			ex_alu_op : out STD_LOGIC_VECTOR(3 downto 0);
			ex_res_flag : out STD_LOGIC_VECTOR(2 downto 0);
			ex_sw_reg_addr : out STD_LOGIC_VECTOR(3 downto 0);
			ex_mem_read : out STD_LOGIC;
			ex_mem_write : out STD_LOGIC

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
	
	component alu_res_mux
		port(
			alu_res_i : in STD_LOGIC_VECTOR(15 downto 0);
			alu_flag_i : in STD_LOGIC_VECTOR(3 downto 0);
			res_flag_i : in STD_LOGIC_VECTOR(2 downto 0);
			ex_res_o : out STD_LOGIC_VECTOR(15 downto 0)
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
			ex_sw_reg_addr : in STD_LOGIC_VECTOR(3 downto 0);
			ex_mem_read : in STD_LOGIC;
			ex_mem_write : in STD_LOGIC;
			-- MEM
			mem_mem_to_reg : out STD_LOGIC; --直接写入寄存器(0)/读取RAM(1)
			mem_reg_write : out STD_LOGIC; --是否写入寄存器
			mem_reg_dst : out STD_LOGIC_VECTOR(3 downto 0); -- 目的寄存器地址（扩展为4位）
			mem_result : out STD_LOGIC_VECTOR(15 downto 0);
			mem_sw_reg_addr : out STD_LOGIC_VECTOR(3 downto 0);
			mem_mem_read : out STD_LOGIC;
			mem_mem_write : out STD_LOGIC;
			clk_mem : out STD_LOGIC
		);
	end component;
	
	COMPONENT data_mem
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		clk_mem : in STD_LOGIC;
		mem_to_reg : IN std_logic;
		mem_read : IN std_logic;
		mem_write : IN std_logic;
		addr_i : IN std_logic_vector(15 downto 0);
		data_i : IN std_logic_vector(15 downto 0);
		sw_reg_data : IN std_logic_vector(15 downto 0);
		ram1_data_in : IN std_logic_vector(15 downto 0);          
		data_o : OUT std_logic_vector(15 downto 0);
		ram1_en : OUT std_logic;
		ram1_we : OUT std_logic;
		ram1_oe : OUT std_logic;
		ram1_addr : OUT std_logic_vector(15 downto 0);
		ram1_data_out : OUT std_logic_vector(15 downto 0);
		ram1_hr : out STD_LOGIC;
		mem_read_en : out STD_LOGIC;
		mem_addr : out STD_LOGIC_VECTOR(15 downto 0);
		mem_write_en : out STD_LOGIC;
		mem_write_data : out STD_LOGIC_VECTOR(15 downto 0);
		inst_i : in STD_LOGIC_VECTOR(15 downto 0);
		rdn: out std_logic;
		wrn: out std_logic;
		data_ready: in std_logic;
		tbre: in std_logic;
		tsre: in std_logic
		);
	END COMPONENT;
	
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
           	select_data_B : out  STD_LOGIC;

           	branch_reg : in STD_LOGIC_VECTOR(3 downto 0);
           	branch_data : out STD_LOGIC_VECTOR(15 downto 0);
           	branch_sel : out STD_LOGIC
           	);
	end component;

	COMPONENT branch_test
	PORT(
		branch_ctr_i : IN std_logic_vector(2 downto 0);
		pc_i : IN std_logic_vector(15 downto 0);
		reg_data_i : IN std_logic_vector(15 downto 0);
		reg_addr_i : in STD_LOGIC_VECTOR(3 downto 0);
		imm_i : IN std_logic_vector(15 downto 0);
		forward_sel : IN std_logic;
		forward_data : IN std_logic_vector(15 downto 0);
		ex_reg_dst : IN std_logic_vector(3 downto 0);          
		pc_mux_sel_o : OUT std_logic;
		pc_branch_o : OUT std_logic_vector(15 downto 0);
		forward_addr : OUT std_logic_vector(3 downto 0);
		stall_req_branch : OUT std_logic;
		clear_next_inst : out STD_LOGIC
		);
	END COMPONENT;

	COMPONENT pc_mux
	PORT(
		pc_mux_sel_i : IN std_logic;
		pc_i : IN std_logic_vector(15 downto 0);
		pc_branch_i : IN std_logic_vector(15 downto 0);          
		pc_mux_o : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	COMPONENT stall_controller
	PORT(
		stall_req_branch : IN std_logic;
		stall_req_if : IN std_logic;
		id_reg1_addr : IN std_logic_vector(3 downto 0);
		id_reg2_addr : IN std_logic_vector(3 downto 0);
		ex_reg_dst : IN std_logic_vector(3 downto 0);
		ex_mem_read : IN std_logic;
		mem_reg_dst : IN std_logic_vector(3 downto 0);
		mem_mem_read : IN std_logic;          
		stall : OUT std_logic
		);
	END COMPONENT;

	-- pc_reg
	signal pc_out : STD_LOGIC_VECTOR(15 downto 0);
	-- pc_mux
	signal pc_mux_o : STD_LOGIC_VECTOR(15 downto 0);
	-- inst_mem
	signal inst_out : STD_LOGIC_VECTOR(15 downto 0);

	signal stall_req_if : STD_LOGIC;

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
	signal res_flag_o : STD_LOGIC_VECTOR(2 downto 0);
	signal branch_ctr_o : STD_LOGIC_VECTOR(2 downto 0);
	signal sw_reg_addr_o : STD_LOGIC_VECTOR(3 downto 0);
	signal mem_read_o : STD_LOGIC;
	signal mem_write_o : STD_LOGIC;

	-- registers
	signal r1_data : STD_LOGIC_VECTOR(15 downto 0);
	signal r2_data : STD_LOGIC_VECTOR(15 downto 0);
	signal mem_sw_reg_data : STD_LOGIC_VECTOR(15 downto 0);

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
	signal ex_res_flag : STD_LOGIC_VECTOR(2 downto 0);
	signal ex_sw_reg_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal ex_mem_read : STD_LOGIC;
	signal ex_mem_write : STD_LOGIC;

	--forward_mux
	signal mux_a : STD_LOGIC_VECTOR(15 downto 0);
	signal mux_b : STD_LOGIC_VECTOR(15 downto 0);

	--alu
	signal result_o : STD_LOGIC_VECTOR(15 downto 0); 
	signal flag_o : STD_LOGIC_VECTOR(3 downto 0);

	--alu_res_mux
	signal ex_res_o : STD_LOGIC_VECTOR(15 downto 0);

	--ex/mem
	signal mem_mem_to_reg : STD_LOGIC; --直接写入寄存器(0)/读取RAM(1)
	signal mem_reg_write : STD_LOGIC; --是否写入寄存器
	signal mem_reg_dst : STD_LOGIC_VECTOR(3 downto 0); -- 目的寄存器地址（扩展为4位）
	signal mem_result : STD_LOGIC_VECTOR(15 downto 0);
	signal mem_mem_read : STD_LOGIC;
	signal mem_mem_write : STD_LOGIC;
	signal mem_sw_reg_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal clk_mem : STD_LOGIC;
	
	--data memory controller
	signal data_o : STD_LOGIC_VECTOR(15 downto 0);
	signal mem_read_en : STD_LOGIC;
	signal mem_addr : STD_LOGIC_VECTOR(15 downto 0);
	signal mem_write_en : STD_LOGIC;
	signal mem_write_data : STD_LOGIC_VECTOR(15 downto 0);
	
	--mem/wb
	signal wb_wdata : STD_LOGIC_VECTOR(15 downto 0);
	signal wb_reg_dst : STD_LOGIC_VECTOR(3 downto 0);
	signal wb_reg_write : STD_LOGIC; --是否写入寄存器
	
	--forwarding_unit
	signal forward_data_a : STD_LOGIC_VECTOR(15 downto 0);
	signal forward_data_b : STD_LOGIC_VECTOR(15 downto 0);
	signal forward_sel_a : STD_LOGIC;
	signal forward_sel_b : STD_LOGIC;
	signal branch_data : STD_LOGIC_VECTOR(15 downto 0);
	signal branch_sel : STD_LOGIC;

	--branch_test
	signal pc_mux_sel_o : STD_LOGIC;
	signal pc_branch_o : STD_LOGIC_VECTOR(15 downto 0);
	signal forward_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal stall_req_branch : STD_LOGIC;
	signal clear_inst_in_if_id : STD_LOGIC;

	--stall_controller
	signal stall : STD_LOGIC;
	
	signal ram2_data_w : STD_LOGIC_VECTOR(15 downto 0);
	signal ram1_data_w : STD_LOGIC_VECTOR(15 downto 0);
	signal ram2_hr : STD_LOGIC;
	signal ram1_hr : STD_LOGIC;
	
	
	--debug
	signal clk : STD_LOGIC;
	signal wrn_o : STD_LOGIC;
	signal rdn_o : STD_LOGIC;
	signal clk25m : STD_LOGIC;
begin
		
	u_pc_reg : pc_reg
	port map(	
		rst => rst,
		clk => clk,
		pc_i => pc_mux_o,
		stall => stall,
		pc_o => pc_out
	);

	--u_pc_adder : pc_adder
	--port map(
	--	pc_i => pc_out,
	--	pc_o => pc_plus_1
	--);

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
		ram2_addr => ram2_addr,
		ram2_data_o => ram2_data_w,
		ram2_hr => ram2_hr,
		mem_read_en => mem_read_en,
		mem_addr => mem_addr,
		mem_write_en => mem_write_en,
		mem_write_data => mem_write_data,
		stall_req_if => stall_req_if

	);

	u_if_id : if_id
	port map(
		rst => rst,
		clk => clk,
		stall => stall, 
		if_pc => pc_out,
		if_inst => inst_out,
		id_pc => id_pc,
		id_inst => id_inst,
		clear_next_inst => clear_inst_in_if_id
		);

	u_registers : registers
	port map(
		rst => rst,
		clk => clk,
		readAddr1 => reg1_addr_o,
		readAddr2 => reg2_addr_o,
		sw_reg_addr => mem_sw_reg_addr,
		readData1 => r1_data,
		readData2 => r2_data,
		sw_reg_data => mem_sw_reg_data,
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
		res_flag_o => res_flag_o,
		reg1_addr_o => reg1_addr_o,
		reg2_addr_o => reg2_addr_o,
		branch_ctr_o => branch_ctr_o,
		sw_reg_addr => sw_reg_addr_o,
		mem_read => mem_read_o,
		mem_write => mem_write_o
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
		stall => stall,
		id_rx => a_o,
		id_ry => b_o,
		id_rx_addr => reg1_addr_o,
		id_ry_addr => reg2_addr_o,
		id_mem_to_reg => mem_to_reg_o,
		id_reg_write => reg_write_o,
		id_reg_dst => reg_dst_o,
		id_alu_op => alu_op_o,
		id_res_flag => res_flag_o,
		id_mem_read => mem_read_o,
		id_mem_write => mem_write_o,
		id_sw_reg_addr => sw_reg_addr_o,
		ex_rx => ex_rx,
		ex_ry => ex_ry,
		ex_rx_addr => ex_rx_addr,
		ex_ry_addr => ex_ry_addr,
		ex_mem_to_reg => ex_mem_to_reg,
		ex_reg_write => ex_reg_write,
		ex_reg_dst => ex_reg_dst,
		ex_alu_op => ex_alu_op,
		ex_res_flag => ex_res_flag,
		ex_mem_read => ex_mem_read,
		ex_mem_write => ex_mem_write,
		ex_sw_reg_addr => ex_sw_reg_addr
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

	u_alu_res_mux : alu_res_mux
	port map(
		alu_res_i => result_o,
		alu_flag_i => flag_o,
		res_flag_i => ex_res_flag,
		ex_res_o => ex_res_o 
		);

	u_ex_mem : ex_mem
	port map(
		rst => rst,
		clk => clk,
		ex_mem_to_reg => ex_mem_to_reg,
		ex_reg_write => ex_reg_write,
		ex_reg_dst => ex_reg_dst,
		ex_result => ex_res_o,
		ex_sw_reg_addr => ex_sw_reg_addr,
		ex_mem_read => ex_mem_read,
		ex_mem_write => ex_mem_write,
		mem_mem_to_reg => mem_mem_to_reg,
		mem_reg_write => mem_reg_write,
		mem_reg_dst => mem_reg_dst,
		mem_result => mem_result,
		mem_mem_read => mem_mem_read,
		mem_mem_write => mem_mem_write,
		mem_sw_reg_addr => mem_sw_reg_addr,
		clk_mem => clk_mem
		);

	u_data_mem : data_mem
	port map(
		rst => rst,
		clk => clk,
		clk_mem => clk_mem,
		mem_to_reg => mem_mem_to_reg,
		mem_read => mem_mem_read,
		mem_write => mem_mem_write,
		sw_reg_data => mem_sw_reg_data,

		addr_i => mem_result,
		data_i => mem_result,
		data_o => data_o,
		
		ram1_en => ram1_en,
		ram1_we => ram1_we,
		ram1_oe => ram1_oe,
		ram1_addr => ram1_addr,
		ram1_data_in => ram1_data,
		ram1_data_out => ram1_data_w,
		ram1_hr => ram1_hr,
		mem_read_en => mem_read_en,
		mem_addr => mem_addr,
		mem_write_en => mem_write_en,
		mem_write_data => mem_write_data,
		inst_i => inst_out,
		rdn => rdn_o,
		wrn => wrn_o,
		data_ready => data_ready,
		tbre => tbre,
		tsre => tsre
		
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
		select_data_B => forward_sel_b,
		branch_reg => forward_addr,
		branch_sel => branch_sel,
		branch_data => branch_data
		);

	Inst_branch_test: branch_test PORT MAP(
		branch_ctr_i => branch_ctr_o,
		pc_i => id_pc,
		reg_data_i => r1_data,
		reg_addr_i => reg1_addr_o,
		imm_i => imm_o,
		pc_mux_sel_o => pc_mux_sel_o,
		pc_branch_o => pc_branch_o,
		forward_sel => branch_sel,
		forward_data => branch_data,
		forward_addr => forward_addr,
		ex_reg_dst => ex_reg_dst,
		stall_req_branch => stall_req_branch,
		clear_next_inst => clear_inst_in_if_id
	);	

	Inst_stall_controller: stall_controller PORT MAP(
		stall_req_branch => stall_req_branch,
		stall_req_if => stall_req_if,
		id_reg1_addr => reg1_addr_o,
		id_reg2_addr => reg2_addr_o,
		ex_reg_dst => ex_reg_dst,
		ex_mem_read => ex_mem_read,
		mem_reg_dst => mem_reg_dst,
		mem_mem_read => mem_mem_read,
		stall => stall
	);

	Inst_pc_mux: pc_mux PORT MAP(
		pc_mux_sel_i => pc_mux_sel_o,
		pc_i => pc_out,
		pc_branch_i => pc_branch_o,
		pc_mux_o => pc_mux_o
	);
		
	rdn <= rdn_o;
	wrn <= wrn_o;
		
	with ram2_hr select
		ram2_data <= (others => 'Z') when '1',
						ram2_data_w when others;
	
	ram1_data <= ram1_data_w;
	
	--ram1_data <= ram1_data_w;
		
		process(pc_out)
		begin
		case PC_out(7 downto 4) is
			when "0000" => digit1 <= "0111111";--0
			when "0001" => digit1 <= "0000110";--1
			when "0010" => digit1 <= "1011011";--2
			when "0011" => digit1 <= "1001111";--3
			when "0100" => digit1 <= "1100110";--4
			when "0101" => digit1 <= "1101101";--5
			when "0110" => digit1 <= "1111101";--6
			when "0111" => digit1 <= "0000111";--7
			when "1000" => digit1 <= "1111111";--8
			when "1001" => digit1 <= "1101111";--9
			when "1010" => digit1 <= "1110111";--A
			when "1011" => digit1 <= "1111100";--B
			when "1100" => digit1 <= "0111001";--C
			when "1101" => digit1 <= "1011110";--D
			when "1110" => digit1 <= "1111001";--E
			when "1111" => digit1 <= "1110001";--F
			when others => digit1 <= "0000000";
		end case;
		
		case pc_out(3 downto 0) is
			when "0000" => digit2 <= "0111111";--0
			when "0001" => digit2 <= "0000110";--1
			when "0010" => digit2 <= "1011011";--2
			when "0011" => digit2 <= "1001111";--3
			when "0100" => digit2 <= "1100110";--4
			when "0101" => digit2 <= "1101101";--5
			when "0110" => digit2 <= "1111101";--6
			when "0111" => digit2 <= "0000111";--7
			when "1000" => digit2 <= "1111111";--8
			when "1001" => digit2 <= "1101111";--9
			when "1010" => digit2 <= "1110111";--A
			when "1011" => digit2 <= "1111100";--B
			when "1100" => digit2 <= "0111001";--C
			when "1101" => digit2 <= "1011110";--D
			when "1110" => digit2 <= "1111001";--E
			when "1111" => digit2 <= "1110001";--F
			when others => digit2 <= "0000000";
		end case;
	end process;
	
	WITH KEYSET(15 DOWNTO 8) SELECT
		LED <= 	pc_out WHEN X"00",
	-- pc_mux
			pc_mux_o WHEN X"01",
	-- inst_mem
			inst_out WHEN X"02",

			"000000000000000" & stall_req_if WHEN X"03",
			
	-- if/id
			id_pc WHEN X"04",
			id_inst WHEN X"05",
	-- controller
			--mem_to_reg_o WHEN X"05",
			"000000000000" & alu_op_o WHEN X"06",
			X"000" & reg_dst_o WHEN X"07",
			"000000000000000" & reg_write_o WHEN X"08",
			X"000" & reg1_addr_o WHEN X"09",
			X"000" & reg2_addr_o WHEN X"0A",
			--a_src_o WHEN X"0B",
			--b_src_o WHEN X"0C",
			--extend_o WHEN X"0D",
			--res_flag_o WHEN X"0E",
			"0000000000000" & branch_ctr_o WHEN X"0B",
			--sw_reg_addr_oIC_VECTOR(3 downto 0);
			--mem_read_o : 
			--mem_write_o :;

	-- registers
			r1_data WHEN X"0C",
			r2_data WHEN X"0D",
			mem_sw_reg_data WHEN X"0E",

	-- extend
			imm_o WHEN X"0F",

	-- src_mux
			a_o WHEN X"10",
			b_o WHEN X"11",

	--id/ex
			ex_rx WHEN X"12",
			ex_ry WHEN X"13",
	--signal ex_rx_addr : STD_LOGIC_VECTOR(3 downto 0);
	--signal ex_ry_addr : STD_LOGIC_VECTOR(3 downto 0);
	--signal ex_mem_to_reg : STD_LOGIC;
	--signal ex_alu_op : STD_LOGIC_VECTOR(3 downto 0);
	--signal ex_reg_dst : STD_LOGIC_VECTOR(3 downto 0);
	--signal ex_reg_write : STD_LOGIC;
	--signal ex_res_flag : STD_LOGIC_VECTOR(2 downto 0);
	--signal ex_sw_reg_addr : STD_LOGIC_VECTOR(3 downto 0);
	--signal ex_mem_read : STD_LOGIC;
	--signal ex_mem_write : STD_LOGIC;

	--forward_mux
			mux_a when x"14",
			mux_b when x"15",

	--alu
			result_o WHEN X"16",
	--signal flag_o : STD_LOGIC_VECTOR(3 downto 0);

	--alu_res_mux
			ex_res_o WHEN X"17",

	--ex/mem
	--signal mem_mem_to_reg : STD_LOGIC; --直接写入寄存器(0)/读取RAM(1)
	--signal mem_reg_write : STD_LOGIC; --是否写入寄存器
	--signal mem_reg_dst : STD_LOGIC_VECTOR(3 downto 0); -- 目的寄存器地址（扩展为4位）
	--signal mem_result : STD_LOGIC_VECTOR(15 downto 0);
	--signal mem_mem_read : STD_LOGIC;
	--signal mem_mem_write : STD_LOGIC;
	--signal mem_sw_reg_addr : STD_LOGIC_VECTOR(3 downto 0);

	--data memory controller
			data_o WHEN X"18",
	--signal mem_read_en : STD_LOGIC;
	--signal mem_addr : STD_LOGIC_VECTOR(15 downto 0);
	--signal mem_write_en : STD_LOGIC;
	--signal mem_write_data : STD_LOGIC_VECTOR(15 downto 0);
	
	--mem/wb
			wb_wdata WHEN X"19",
			--wb_reg_dst : STD_LOGIC_VECTOR(3 downto 0);
	--signal wb_reg_write : STD_LOGIC; --是否写入寄存器
	
	--forwarding_unit
	--signal forward_data_a : STD_LOGIC_VECTOR(15 downto 0);
	--signal forward_data_b : STD_LOGIC_VECTOR(15 downto 0);
	--signal forward_sel_a : STD_LOGIC;
	--signal forward_sel_b : STD_LOGIC;
	--signal branch_data : STD_LOGIC_VECTOR(15 downto 0);
	--signal branch_sel : STD_LOGIC;

	--branch_test
			"000000000000000" & pc_mux_sel_o WHEN X"20",
			pc_branch_o WHEN X"21",
	--signal forward_addr : STD_LOGIC_VECTOR(3 downto 0);
	--signal stall_req_branch : STD_LOGIC;
			"000000000000000" & clear_inst_in_if_id WHEN X"22",
			"00000000000" & tbre & tsre & rdn_o & wrn_o & data_ready when x"23",
			X"FFFF" WHEN OTHERS;

	--stall_controller
	--signal stall : STD_LOGIC;
	
	--signal ram2_data_w : STD_LOGIC_VECTOR(15 downto 0);
	--signal ram1_data_w : STD_LOGIC_VECTOR(15 downto 0);
	--signal ram2_hr : STD_LOGIC;
	--signal ram1_hr : STD_LOGIC;

	process(rst,clk50m)
	
	begin
		if (rst = '0') then
			clk25m <= '0';
		elsif (rising_edge(clk50m)) then
			clk25m <= not clk25m;
		end if;
	end process;

	with keyset(1 downto 0) select
		clk <= clk50m when "00",
		clk11m when "01",
		clk25m when "10",
		clk1x when others;
		
		
end Behavioral;

