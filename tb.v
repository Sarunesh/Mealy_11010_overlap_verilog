module top;
	wire data_out;
	reg clk;
	reg rst;
	reg data_in;

	mealy_overlap_11010 dut(
							.clk(clk),
							.rst(rst),
							.data_in(data_in),
							.data_out(data_out)
							);

	always #5 clk=~clk;

	initial begin
		clk=0;
		rst=0;
	end

	initial begin
		rst=1;
		repeat(2)@(posedge clk);
		rst=0;
      	#5;
		data_in=1;
		#10;
      	$display("data_out=%0b", data_out);
		data_in=1;
		#10;
      	$display("data_out=%0b", data_out);
		data_in=0;
		#10;
      	$display("data_out=%0b", data_out);
		data_in=1;
		#10;
      	$display("data_out=%0b", data_out);
		data_in=0;
		#10;
      	$display("data_out=%0b", data_out);
		data_in=1;
		#10;
      	$display("data_out=%0b", data_out);
		data_in=1;
		#10;
      	$display("data_out=%0b", data_out);
		data_in=0;
		#10;
      	$display("data_out=%0b", data_out);
		data_in=1;
		#10;
      	$display("data_out=%0b", data_out);
		data_in=0;
		#10;
      	$display("data_out=%0b", data_out);
		data_in=1;
		#10;
      	$display("data_out=%0b", data_out);
		$finish;
	end
endmodule
