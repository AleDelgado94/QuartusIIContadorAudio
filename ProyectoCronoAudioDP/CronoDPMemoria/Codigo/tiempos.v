module tiempos (input wire clk, reset, enable, continuo,output reg clk_1hz);

reg [24:0] counter;
initial 
begin
    counter = 0;
    clk_1hz = 0;
end

	always @(posedge clk) 
	begin
		if(enable && !continuo) begin
			 if (counter == 0) begin
				  counter <= 24999999;
				  clk_1hz <= ~clk_1hz;
			 end 
			 else begin
				  counter <= counter - 1;
			 end
		 end
		else if(enable && continuo) begin
				clk_1hz <= 1;
		end
		
		if(!enable) begin
				clk_1hz <= ~clk_1hz;
		end
	end


endmodule

module sound (input wire [7:0] outCPU1, input wire s_enable, output reg [51:0] sonido);

always @(*)
 begin
  
  if(s_enable && outCPU1 >= 8'b00011110)
		sonido <= 17980;
  else if(s_enable && outCPU1 >= 8'b00010100)
	   sonido <= 19200;
  else if(s_enable && outCPU1 >= 8'b00001010)
	   sonido <= 19200;
  else if(s_enable && outCPU1 >= 8'b00000101)
      sonido <= 24000;
  else if(s_enable && outCPU1 >= 8'b00000001)
      sonido <= 28800;
  else if(s_enable && outCPU1 == 8'b0)
      sonido <= 32000;
  else
		sonido <= 0;
 end

 endmodule
 
 module sound_continuado(input wire reset, input wire [7:0] outCPU1, output reg cont);
 
	always @(*)
	begin
		if(reset)
		begin
			cont <= 1'b0;
		end
		else if(outCPU1 == 8'b0)
		begin
			cont <= 1'b1;
		end
		else
		begin
			cont <= 1'b0;
		end
	end
 
 endmodule
 
 