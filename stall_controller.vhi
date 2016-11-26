
-- VHDL Instantiation Created from source file stall_controller.vhd -- 00:48:36 11/26/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_stall_controller: stall_controller PORT MAP(
		stall_req_branch => ,
		stall_req_if => ,
		id_reg1_addr => ,
		id_reg2_addr => ,
		ex_reg_dst => ,
		ex_mem_read => ,
		mem_reg_dst => ,
		mem_mem_read => ,
		stall => 
	);


