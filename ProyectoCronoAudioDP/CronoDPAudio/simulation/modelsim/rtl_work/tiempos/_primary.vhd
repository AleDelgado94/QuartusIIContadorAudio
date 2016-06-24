library verilog;
use verilog.vl_types.all;
entity tiempos is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        clk_1hz         : out    vl_logic
    );
end tiempos;
