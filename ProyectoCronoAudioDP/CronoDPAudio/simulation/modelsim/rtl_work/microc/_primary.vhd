library verilog;
use verilog.vl_types.all;
entity microc is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        s_inc           : in     vl_logic;
        s_inm           : in     vl_logic;
        we3             : in     vl_logic;
        s_subrutina     : in     vl_logic;
        s_ra            : in     vl_logic;
        s_rel           : in     vl_logic;
        op              : in     vl_logic_vector(2 downto 0);
        z               : out    vl_logic;
        opcode          : out    vl_logic_vector(5 downto 0);
        in1             : in     vl_logic_vector(7 downto 0);
        in2             : in     vl_logic_vector(7 downto 0);
        in3             : in     vl_logic_vector(7 downto 0);
        in4             : in     vl_logic_vector(7 downto 0);
        out1            : out    vl_logic_vector(7 downto 0);
        out2            : out    vl_logic_vector(7 downto 0);
        out3            : out    vl_logic_vector(7 downto 0);
        out4            : out    vl_logic_vector(7 downto 0);
        s_in            : in     vl_logic;
        s_out           : in     vl_logic;
        out_in          : in     vl_logic
    );
end microc;
