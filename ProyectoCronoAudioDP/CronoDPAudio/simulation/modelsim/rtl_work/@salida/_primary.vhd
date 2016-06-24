library verilog;
use verilog.vl_types.all;
entity Salida is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        s_out           : in     vl_logic;
        out_in          : in     vl_logic;
        entReg          : in     vl_logic_vector(7 downto 0);
        entInmediato    : in     vl_logic_vector(7 downto 0);
        s               : in     vl_logic_vector(1 downto 0);
        sal1            : out    vl_logic_vector(7 downto 0);
        sal2            : out    vl_logic_vector(7 downto 0);
        sal3            : out    vl_logic_vector(7 downto 0);
        sal4            : out    vl_logic_vector(7 downto 0)
    );
end Salida;
