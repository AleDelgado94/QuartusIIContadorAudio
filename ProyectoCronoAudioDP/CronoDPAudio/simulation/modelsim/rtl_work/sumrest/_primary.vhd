library verilog;
use verilog.vl_types.all;
entity sumrest is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        a               : in     vl_logic_vector(9 downto 0);
        b               : in     vl_logic_vector(8 downto 0);
        s               : in     vl_logic;
        y               : out    vl_logic_vector(9 downto 0)
    );
end sumrest;
