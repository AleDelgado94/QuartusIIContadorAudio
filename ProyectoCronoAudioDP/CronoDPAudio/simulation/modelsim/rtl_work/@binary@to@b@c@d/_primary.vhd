library verilog;
use verilog.vl_types.all;
entity BinaryToBCD is
    port(
        num             : in     vl_logic_vector(7 downto 0);
        ONES            : out    vl_logic_vector(3 downto 0);
        TENS            : out    vl_logic_vector(3 downto 0);
        HUNDREDS        : out    vl_logic_vector(1 downto 0)
    );
end BinaryToBCD;
