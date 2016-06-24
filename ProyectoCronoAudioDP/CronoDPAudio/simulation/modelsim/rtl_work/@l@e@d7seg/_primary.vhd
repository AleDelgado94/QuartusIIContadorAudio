library verilog;
use verilog.vl_types.all;
entity LED7seg is
    port(
        num             : in     vl_logic_vector(3 downto 0);
        sA              : out    vl_logic;
        sB              : out    vl_logic;
        sC              : out    vl_logic;
        sD              : out    vl_logic;
        sE              : out    vl_logic;
        sF              : out    vl_logic;
        sG              : out    vl_logic;
        sDP             : out    vl_logic
    );
end LED7seg;
