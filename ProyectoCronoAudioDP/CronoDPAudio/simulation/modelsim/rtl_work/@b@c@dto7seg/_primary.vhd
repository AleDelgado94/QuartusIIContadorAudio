library verilog;
use verilog.vl_types.all;
entity BCDto7seg is
    port(
        ONES            : in     vl_logic_vector(3 downto 0);
        TENS            : in     vl_logic_vector(3 downto 0);
        HUNDREDS        : in     vl_logic_vector(1 downto 0);
        l1              : out    vl_logic_vector(7 downto 0);
        l2              : out    vl_logic_vector(7 downto 0);
        l3              : out    vl_logic_vector(7 downto 0)
    );
end BCDto7seg;
