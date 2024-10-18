module mealy_overlap_11010(clk,rst,data_in,data_out);
	// State parameters
	parameter S0 = 0;
	parameter S1 = 1;
	parameter S11 = 2;
	parameter S110 = 3;
	parameter S1101 = 4;

	// Port directions
	output reg data_out;
	input wire clk;
	input wire rst;
	input wire data_in;

	// Internal registers
	reg flag;
	reg [2:0] state;

	always@(posedge clk)begin
		if(rst)begin
			data_out = 0;
		end
		else begin
			flag = 0;
			case(state)
				S0:begin
					if(data_in) state=S1;
					else state=S0;
				end
				S1:begin
					if(data_in) state=S11;
					else state=S0;
				end
				S11:begin
					if(!data_in) state=S110;
					else state=S11;
				end
				S110:begin
					if(data_in) state=S1101;
					else state=S0;
				end
				S1101:begin
					if(!data_in)begin
						state=S0;
						flag=1;
					end
					else state=S11;
				end
				default:begin
					if(data_in) state=S1;
					else state=state;
				end
			endcase
			data_out = flag;
		end
	end
endmodule
