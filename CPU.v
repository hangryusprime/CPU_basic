`timescale 1ns / 1ps

module CPU(clk, reset, opcode, zero, ALUOut_wire, PCout, IRout, branch, jump);

input clk, reset;

output zero,branch, jump;
output [5:0] opcode;
output [31:0] ALUOut_wire, PCout, IRout;

wire PCWrite, PCWriteCond, IRWrite, DMEMWrite, RegWrite, ALUSrcA, RegReadSel, zero,
     branch, jump;
wire [1:0] MemtoReg, ALUSrcB, PCSource;
wire [3:0] ALUSel;
wire [5:0] opcode;
wire [31:0] ALUOut_wire, PCout, IRout;


datapath		cpu_datapath(clk, reset, PCWrite, PCWriteCond, IRWrite, DMEMWrite, RegWrite, ALUSrcA, RegReadSel,
									 MemtoReg, ALUSrcB, PCSource, ALUSel, opcode, zero, ALUOut_wire, PCout, IRout, branch, jump);


controller		cpu_controller(opcode, clk, reset, PCWrite, PCWriteCond, DMEMWrite, IRWrite, 
										MemtoReg, PCSource, ALUSel, ALUSrcA, ALUSrcB, RegWrite, RegReadSel);

endmodule
