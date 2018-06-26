`timescale 1ns / 1ps

module CPU_tb;

	// Inputs
	reg reset;
	reg clk = 0;
	
	// Outputs
	
	wire [5:0] opcode;
	wire [31:0] PCout;
	wire [31:0] IRout;
	wire [31:0] ALUOut_wire;
	wire zero;
	wire branch, jump;

	// Instantiate the Unit Under Test (UUT)
	CPU uut(
		.clk(clk), 
		.reset(reset),  
		.opcode(opcode), 
		.zero(zero), 
		.ALUOut_wire(ALUOut_wire), 
		.PCout(PCout), 
		.IRout(IRout),
		.branch(branch),
		.jump(jump)
	);

always
	#5 clk = ~clk;
	initial begin
		// Initialize Inputs
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset <= 0;		// drop reset

	end
      
endmodule


