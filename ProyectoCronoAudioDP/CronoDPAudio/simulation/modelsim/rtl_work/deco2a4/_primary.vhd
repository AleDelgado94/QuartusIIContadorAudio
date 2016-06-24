library verilog;
use verilog.vl_types.all;
entity deco2a4 is
    port(
        s               : in     vl_logic_vector(1 downto 0);
        enable_sal0     : out    vl_logic;
        enable_sal1     : out    vl_logic;
        enable_sal2     : out    vl_logic;
        enable_sal3     : out    vl_logic
    );
end deco2a4;
