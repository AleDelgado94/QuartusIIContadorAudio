

module Entrada(input wire clk, reset, input wire [7:0] in1, in2, in3, in4, output wire [7:0] salEntrada, input wire [1:0] s);
 
//ENTRADA/SALIDA

mux4 #(8) muxEntrada(in1, in2, in3, in4, s, salEntrada);


endmodule


module Salida(input wire clk, reset, s_out, out_in ,input wire [7:0] entReg, entInmediato, input wire [1:0] s, output wire [7:0] sal1, sal2, sal3, sal4);

wire salDeco0, salDeco1, salDeco2, salDeco3;
wire [7:0] salMUX4;

deco2a4 deco(s, salDeco0, salDeco1, salDeco2, salDeco3);

//mux2 #(8) MUX4(entInmediato, entReg, s_out, salMUX4);

registro2 #(8) salida1(clk, reset, salDeco0, s_out, out_in, entReg, entInmediato, sal1);
registro2 #(8) salida2(clk, reset, salDeco1, s_out, out_in, entReg, entInmediato, sal2);
registro2 #(8) salida3(clk, reset, salDeco2, s_out, out_in, entReg, entInmediato, sal3);
registro2 #(8) salida4(clk, reset, salDeco3, s_out, out_in, entReg, entInmediato, sal4);

endmodule
