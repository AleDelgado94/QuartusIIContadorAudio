library verilog;
use verilog.vl_types.all;
entity BinaryTo7seg is
    port(
        num             : in     vl_logic_vector(7 downto 0);
        l1              : out    vl_logic_vector(7 downto 0);
        l2              : out    vl_logic_vector(7 downto 0);
        l3              : out    vl_logic_vector(7 downto 0)
    );
end BinaryTo7seg;
