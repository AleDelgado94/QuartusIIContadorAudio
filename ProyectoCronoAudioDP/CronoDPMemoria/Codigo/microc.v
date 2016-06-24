

module microc(input wire clk, reset, s_inc, s_inm, we3, s_subrutina, s_ra, s_rel, input wire [2:0] op, output wire z, output wire [5:0] opcode, input wire [7:0] in1, in2, in3, in4, output wire [7:0] out1, out2, out3, out4, input wire s_in, s_out, out_in);

//CONEXIONES INTERNAS

wire [9:0] salMUX0;
wire [9:0] salSUM0;
wire [9:0] salSUMSUBRUTINA;
wire [9:0] salra;
wire [7:0] salALU;
wire [7:0] salMUX1;
wire [9:0] salMUX3;
wire [9:0] salMUX5;

wire [9:0] salPC;
wire [15:0] DATOS;

wire [7:0] RD1;
wire [7:0] RD2;
wire [7:0] WD3;
wire [9:0] salMUXSUBRUTINA;
wire [15:0] salMPROG;
wire [9:0] salSUMREST;

wire [7:0] SAL_ENTRADA;
//Instanciar e interconectar pc, memprog, regfile, alu, sum y mux's

registro #(10) PC(clk, reset, salMUX5, salPC); //CONTADOR DE PROGRAMA
mux2 #(10) MUX0(DATOS[15:6], salSUM0, s_inc, salMUX0); //MUX PC
mux2 #(8) MUX1(salALU, DATOS[11:4], s_inm, salMUX1); //MUX BREG
sum SUM0(10'b1, salPC, salSUM0); //SUMADOR
alu ALU(RD1, RD2, op, salALU, z); //ALU
regfile BREGS(clk, we3, DATOS[7:4], DATOS[11:8], DATOS[15:12], WD3, RD1, RD2); //BANCO DE REGISTROS
memprog MPROG(clk, salPC, DATOS); //MEMORIA DEL PROGRAMA

//ENTRADA
Entrada entra(clk, reset, in1, in2, in3, in4, SAL_ENTRADA, DATOS[7:6]);
mux2 #(8) MUX2(salMUX1, SAL_ENTRADA, s_in, WD3);


//SALIDA
Salida  sale(clk,reset, s_out, out_in, RD2, DATOS[15:8], DATOS[7:6], out1, out2, out3, out4);


//SALTO y VUELTA a SUBRUTINA
sum SUMSUBRUTINA(10'b1, salPC, salSUMSUBRUTINA);
registro3 #(10) ra(clk, reset, s_subrutina, salSUMSUBRUTINA, salra);

mux2 #(10) MUX3(salMUX0, salra, s_ra, salMUX3);

//SALTO RELATIVO
sumrest SUMREST(clk, reset, salPC, DATOS[14:6], DATOS[15], salSUMREST);
mux2 #(10) MUX5(salMUX3, salSUMREST, s_rel, salMUX5);



assign opcode = DATOS[5:0];


endmodule
