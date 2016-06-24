library verilog;
use verilog.vl_types.all;
entity Entrada is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        in1             : in     vl_logic_vector(7 downto 0);
        in2             : in     vl_logic_vector(7 downto 0);
        in3             : in     vl_logic_vector(7 downto 0);
        in4             : in     vl_logic_vector(7 downto 0);
        salEntrada      : out    vl_logic_vector(7 downto 0);
        s               : in     vl_logic_vector(1 downto 0)
    );
end Entrada;
