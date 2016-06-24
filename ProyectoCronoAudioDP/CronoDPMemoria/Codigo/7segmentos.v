
module add3(input wire [3:0] in, output reg [3:0] out);
always @ (in)
	 case (in)
		 4'b0000: out <= 4'b0000;
		 4'b0001: out <= 4'b0001;
		 4'b0010: out <= 4'b0010;
		 4'b0011: out <= 4'b0011;
		 4'b0100: out <= 4'b0100;
		 4'b0101: out <= 4'b1000;
		 4'b0110: out <= 4'b1001;
		 4'b0111: out <= 4'b1010;
		 4'b1000: out <= 4'b1011;
		 4'b1001: out <= 4'b1100;
		 default: out <= 4'b0000;
	endcase
endmodule



module BinaryToBCD(input wire [7:0] num, output wire [3:0] ONES, TENS, output wire [1:0] HUNDREDS);

wire [3:0] c1, c2, c3, c4, c5, c6, c7;
wire [3:0] d1, d2, d3, d4, d5, d6, d7;

assign d1 = {1'b0, num[7:5]};
assign d2 = {c1[2:0], num[4]};
assign d3 = {c2[2:0], num[3]};
assign d4 = {c3[2:0], num[2]};
assign d5 = {c4[2:0], num[1]};
assign d6 = {1'b0, c1[3], c2[3], c3[3]};
assign d7 = {c6[2:0], c4[3]};

add3 m1(d1,c1);
add3 m2(d2,c2);
add3 m3(d3,c3);
add3 m4(d4,c4);
add3 m5(d5,c5);
add3 m6(d6,c6);
add3 m7(d7,c7);
assign ONES = {c5[2:0],num[0]};
assign TENS = {c7[2:0],c5[3]};
assign HUNDREDS = {c6[3],c7[3]};


endmodule

module LED7seg(input wire [3:0] num, 
				output wire sA, sB, sC, sD,
				sE, sF, sG, sDP);
				
reg [7:0] segmentos7;

	always@(*)
		begin
		case (num)
			4'b0000:  segmentos7 = 8'b11111100; 
			4'b0001:  segmentos7 = 8'b01100000;
			4'b0010:  segmentos7 = 8'b11011010;
			4'b0011:  segmentos7 = 8'b11110010;
			4'b0100:  segmentos7 = 8'b01100110;
			4'b0101:  segmentos7 = 8'b10110110;
			4'b0110:  segmentos7 = 8'b10111110;
			4'b0111:  segmentos7 = 8'b11100000;
			4'b1000:  segmentos7 = 8'b11111110;
			4'b1001:  segmentos7 = 8'b11100110;	
			default:  segmentos7 = 8'b00000000;
		endcase
		end
		
		assign {sA, sB, sC, sD, sE, sF, sG, sDP} = segmentos7;
		
				
endmodule

module BCDto7seg(input wire [3:0] ONES, TENS, input wire [1:0] HUNDREDS, output wire [7:0] l1, l2, l3);

wire sA1, sB1, sC1, sD1, sE1, sF1, sG1, sDP1;
wire sA2, sB2, sC2, sD2, sE2, sF2, sG2, sDP2;
wire sA3, sB3, sC3, sD3, sE3, sF3, sG3, sDP3;	

	
	LED7seg led1(HUNDREDS, sA1, sB1, sC1, sD1, sE1, sF1, sG1, sDP1);
	LED7seg led2(TENS, sA2, sB2, sC2, sD2, sE2, sF2, sG2, sDP2);
	LED7seg led3(ONES, sA3, sB3, sC3, sD3, sE3, sF3, sG3, sDP3);
	
	assign l1 = {sA1, sB1, sC1, sD1, sE1, sF1, sG1, sDP1};
	assign l2 = {sA2, sB2, sC2, sD2, sE2, sF2, sG2, sDP2};
	assign l3 = {sA3, sB3, sC3, sD3, sE3, sF3, sG3, sDP3};

endmodule

module BinaryTo7seg(input wire [7:0] num, output wire [7:0] l1, l2, l3);
	
wire [3:0] ONES, TENS;
wire [1:0] HUNDREDS;
	
	BinaryToBCD binTobcd(num, ONES, TENS, HUNDREDS);
	BCDto7seg bcdTo7seg(ONES, TENS, HUNDREDS, l1, l2, l3);


endmodule

