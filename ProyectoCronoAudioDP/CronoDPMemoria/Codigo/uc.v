//UNIDAD DE CONTROL

module uc(input wire clk, reset, z, input wire [5:0] opcode, output reg s_inc, s_inm, we3, s_in, s_out, s_subrutina, s_ra, s_rel, out_in, output reg [2:0] op);

    reg zero;

    always @(z, clk)
    begin
        if(opcode[3] == 1'b0)
		  begin 
            zero <= z;
        end
    end
	 

    always @(*)
    begin
        

        casez (opcode[5:0])

            6'b??0???:
            begin 

                we3 <= 1'b1;
				s_inm <= 1'b0;
				s_inc <= 1'b1;
				op <= opcode[2:0];
                s_in <= 1'b0;
                s_out <= 1'b0;
                out_in <= 1'b0;
                s_subrutina <= 1'b0;
                s_ra <= 1'b0;
                s_rel <= 1'b0;
            end
            
            6'b??1000:    //LI
            begin
                we3 <= 1'b1;
				s_inm <= 1'b1;
				s_inc <= 1'b1;
				op <= 3'b000;
                s_in <= 1'b0;
                s_out <= 1'b0;
                out_in <= 1'b0;
                s_subrutina <= 1'b0;
                s_ra <= 1'b0;
                s_rel <= 1'b0;
            end

            6'b?01001:    //SALTO INCONDICIONAL JUMP
            begin
				we3 <= 1'b0;
				s_inm <= 1'b0;
				s_inc <= 1'b0;
				op <= 3'b000;
                s_in <= 1'b0;
                s_out <= 1'b0;
                out_in <= 1'b0;
                s_subrutina <= 1'b0;
                s_ra <= 1'b0;
                s_rel <= 1'b0;
            end

            6'b?01010:    //BIZ salto = 0
            begin
                if(zero)
                begin
				    we3 <= 1'b0;
				    s_inm <= 1'b0;
				    s_inc <= 1'b0;
				    op <= 3'b000;
                    s_in <= 1'b0;
                    s_out <= 1'b0;
                    out_in <= 1'b0;
                    s_subrutina <= 1'b0;
                    s_ra <= 1'b0;
                    s_rel <= 1'b0;
                end
    
                else
                begin
				    we3 <= 1'b0;
				    s_inm <= 1'b0;
				    s_inc <= 1'b1;
				    op <= 3'b000;
                    s_in <= 1'b0;
                    s_out <= 1'b0;
                    out_in <= 1'b0;
                    s_subrutina <= 1'b0;
                    s_ra <= 1'b0;
                    s_rel <= 1'b0;
                end
            end
            
            6'b?01011:    //BNIZ salto != 0
            begin
                if(!zero)
                begin
        		    we3 <= 1'b0;
				    s_inm <= 1'b0;
				    s_inc <= 1'b0;
				    op <= 3'b000;
                    s_in <= 1'b0;
                    s_out <= 1'b0;
                    out_in <= 1'b0;
                    s_subrutina <= 1'b0;
                    s_ra <= 1'b0;
                    s_rel <= 1'b0;
                end

                else 
                begin
				    we3 <= 1'b0;
				    s_inm <= 1'b0;
				    s_inc <= 1'b1;
				    op <= 3'b000;
                    s_in <= 1'b0;
                    s_out <= 1'b0;
                    out_in <= 1'b0;
                    s_subrutina <= 1'b0;
                    s_ra <= 1'b0;
                    s_rel <= 1'b0;
                end
            end

            6'b??1100:    //OUT_IN
            begin
                we3 <= 1'b0;
				s_inm <= 1'b0;
				s_inc <= 1'b1;
				op <= 3'b000;
                s_in <= 1'b0;
                s_out <= 1'b0;
                out_in <= 1'b1;
                s_subrutina <= 1'b0;
                s_ra <= 1'b0;
                s_rel <= 1'b0;
            end


            6'b111010:   //SALTO RELATIVO
            begin
            we3 <= 1'b0;
			s_inm <= 1'b0;
			s_inc <= 1'b0;
			op <= 3'b000;
            s_in <= 1'b0;
            s_out <= 1'b0;
            out_in <= 1'b0;
            s_subrutina <= 1'b0;
            s_ra <= 1'b0;
            s_rel <= 1'b1;


            end

          
            6'b111011:  //salto subrutina
            begin
                we3 <= 1'b0;
				s_inm <= 1'b0;
				s_inc <= 1'b0;
				op <= 3'b000;
                s_in <= 1'b0;
                s_out <= 1'b0;
                out_in <= 1'b0;
                s_subrutina <= 1'b1;
                s_ra <= 1'b0;
                s_rel <= 1'b0;
            end


            6'b111101:    //vuelta subrutina
            begin
                we3 <= 1'b0;
				s_inm <= 1'b0;
				s_inc <= 1'b0;
				op <= 3'b000;
                s_in <= 1'b0;
                s_out <= 1'b0;
                out_in <= 1'b0;
                s_subrutina <= 1'b0;
                s_ra <= 1'b1;
                s_rel <= 1'b0;
            end



            6'b111110:    //OUT
            begin
                we3 <= 1'b0;
				s_inm <= 1'b0;
				s_inc <= 1'b1;
				op <= 3'b000;
                s_in <= 1'b0;
                s_out <= 1'b1;
                out_in <= 1'b0;
                s_subrutina <= 1'b0;
                s_ra <= 1'b0;
                s_rel <= 1'b0;
            end


            6'b111111:    //IN
            begin
                we3 <= 1'b1;
				s_inm <= 1'b0;
				s_inc <= 1'b1;
				op <= 3'b000;
                s_in <= 1'b1;
                s_out <= 1'b0;
                out_in <= 1'b0;
                s_subrutina <= 1'b0;
                s_ra <= 1'b0;
                s_rel <= 1'b0;
            end

            default:
            begin
				we3 <= 1'b0;
				s_inm <= 1'b0;
				s_inc <= 1'b1;
				op <= 3'b000;
                s_in <= 1'b0;
                s_out <= 1'b0;
                out_in <= 1'b0;
                s_subrutina <= 1'b0;
                s_ra <= 1'b0;
                s_rel <= 1'b0;
            end
    endcase
    end

endmodule
