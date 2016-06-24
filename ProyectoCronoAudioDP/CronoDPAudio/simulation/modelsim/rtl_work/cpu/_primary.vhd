library verilog;
use verilog.vl_types.all;
entity cpu is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        inCPU1          : in     vl_logic_vector(7 downto 0);
        inCPU2          : in     vl_logic_vector(7 downto 0);
        inCPU3          : in     vl_logic_vector(7 downto 0);
        inCPU4          : in     vl_logic_vector(7 downto 0);
        outCPU1         : out    vl_logic_vector(7 downto 0);
        outCPU2         : out    vl_logic_vector(7 downto 0);
        outCPU3         : out    vl_logic_vector(7 downto 0);
        outCPU4         : out    vl_logic_vector(7 downto 0);
        lout1           : out    vl_logic_vector(7 downto 0);
        lout2           : out    vl_logic_vector(7 downto 0);
        lout3           : out    vl_logic_vector(7 downto 0);
        CLOCK_27        : in     vl_logic;
        I2C_SDAT        : inout  vl_logic;
        I2C_SCLK        : out    vl_logic;
        AUD_DACLRCK     : out    vl_logic;
        AUD_DACDAT      : out    vl_logic;
        AUD_BCLK        : inout  vl_logic;
        AUD_XCK         : out    vl_logic
    );
end cpu;
