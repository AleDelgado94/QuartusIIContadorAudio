library verilog;
use verilog.vl_types.all;
entity uc is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        z               : in     vl_logic;
        opcode          : in     vl_logic_vector(5 downto 0);
        s_inc           : out    vl_logic;
        s_inm           : out    vl_logic;
        we3             : out    vl_logic;
        s_in            : out    vl_logic;
        s_out           : out    vl_logic;
        s_subrutina     : out    vl_logic;
        s_ra            : out    vl_logic;
        s_rel           : out    vl_logic;
        out_in          : out    vl_logic;
        op              : out    vl_logic_vector(2 downto 0)
    );
end uc;
