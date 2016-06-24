//Componentes varios

//Banco de registros de dos salidas y una entrada
module regfile(input  wire        clk, 
               input  wire        we3,           //señal de habilitación de escritura
               input  wire [3:0]  ra1, ra2, wa3, //direcciones de regs leidos y reg a escribir
               input  wire [7:0]  wd3, 			 //dato a escribir
               output wire [7:0]  rd1, rd2);     //datos leidos

  reg [7:0] regb[0:15]; //memoria de 16 registros de 8 bits de ancho

  // El registro 0 siempre es cero
  // se leen dos reg combinacionalmente
  // y la escritura del tercero ocurre en flanco de subida del reloj
  always @(posedge clk)
    if (we3) regb[wa3] <= wd3;	
  
  assign rd1 = (ra1 != 0) ? regb[ra1] : 0;
  assign rd2 = (ra2 != 0) ? regb[ra2] : 0;
endmodule







//modulo sumador  
module sum(input  wire [9:0] a, b,
             output wire [9:0] y);

  assign y = a + b;
endmodule




//modulo de registro para modelar el PC, cambia en cada flanco de subida de reloj o de reset
module registro #(parameter WIDTH = 8)
              (input  wire             clk, reset,
               input  wire [WIDTH-1:0] d, 
               output reg  [WIDTH-1:0] q);

  always @(posedge clk, posedge reset)
    if (reset) q <= 0;
    else       q <= d;
endmodule


//modulo multiplexor, cos s=1 sale d1, s=0 sale d0
module mux2 #(parameter WIDTH = 8)
             (input  wire [WIDTH-1:0] d0, d1, 
              input  wire             s, 
              output wire [WIDTH-1:0] y);

  assign y = s ? d1 : d0; 
endmodule


//DECODIFICADOR DE 2 A 4

module deco2a4(input wire [1:0] s, output reg enable_sal0, enable_sal1, enable_sal2, enable_sal3);

  always  @(*)
  begin
    case(s[1:0])
    
      2'b00:
      begin
       enable_sal0 = 1'b1;
       enable_sal1 = 1'b0;
       enable_sal2 = 1'b0;
       enable_sal3 = 1'b0;
      end

      2'b01:
      begin
        enable_sal0 = 1'b0;
        enable_sal1 = 1'b1;
        enable_sal2 = 1'b0;
        enable_sal3 = 1'b0;
      end
      
      2'b10:
      begin
       enable_sal0 = 1'b0;
       enable_sal1 = 1'b0;
       enable_sal2 = 1'b1;
       enable_sal3 = 1'b0;
      end
      
      2'b11:
      begin
       enable_sal0 = 1'b0;
       enable_sal1 = 1'b0;
       enable_sal2 = 1'b0;
       enable_sal3 = 1'b1;
      end

      default:
      begin
         enable_sal0 = 1'b0;
         enable_sal1 = 1'b0;
         enable_sal2 = 1'b0;
         enable_sal3 = 1'b0;
      end
    endcase
  end
endmodule





//modulo multiplexor de 4 a 1
module mux4 #(parameter WIDTH = 8)
             (input  wire [WIDTH-1:0] d0, d1, d2, d3, 
              input  wire [1:0]          s, 
              output reg [WIDTH-1:0] y);


  always @(*)
  begin
    if(s == 2'b00) y <= d0;
    else if(s == 2'b01)  y <= d1;
    else if(s == 2'b10)  y <= d2;
    else y <= d3;
  end

endmodule


//Registro de salida

module registro2 #(parameter WIDTH = 8)
              (input  wire             clk, reset, enable_mux, s_out ,out_in,
               input  wire [WIDTH-1:0] d0, d1, 
               output reg  [WIDTH-1:0] q);

  always @(posedge clk, posedge reset)
    if (reset) q <= 0;
    else if(enable_mux && s_out)      q <= d0;
    else if(enable_mux && out_in)     q <= d1;
endmodule 

module registro3 #(parameter WIDTH = 8)
              (input  wire             clk, reset, enable_mux,
               input  wire [WIDTH-1:0] d0, 
               output reg  [WIDTH-1:0] q);

  always @(posedge clk, posedge reset)
    if (reset) q <= 0;
    else if(enable_mux)      q <= d0;
endmodule 

 
//SUMADOR RESTADOR para SALTO RELATIVO

module sumrest(input wire clk, reset, input  wire [9:0] a, input wire [8:0] b, input wire s,
             output reg [9:0] y); 

  always @(*)
  begin
    if(reset)
        y <= 10'b0;
    else if(s)
        y <= a - b;
    else
        y <= a + b;
  end   

endmodule


