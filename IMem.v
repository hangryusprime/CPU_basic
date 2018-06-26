`timescale 1ns / 1ps

`define PROGRAM // fibonacci series

module IMem(PC,Instruction, branch, jump);

`ifdef PROGRAM
	parameter PROG_LENGTH= 30;
`endif
//-------------Input Ports-----------------------------
input [31:0] PC;
//-------------Output Ports----------------------------
output [31:0] Instruction;
output branch, jump;
reg [31:0] Instruction;
reg branch, jump;
always @* begin
if (Instruction[31:26] == 6'b100000 | Instruction[31:26] == 6'b100001 | Instruction[31:26] == 6'b100010 | 
    Instruction[31:26] == 6'b100011 ) begin
			branch <= 1;
		end
		else begin
			branch <= 0;
		end
end
always @* begin
		if (Instruction[31:26] == 6'b000001) begin
			jump <= 1;
		end
		else begin
			jump <= 0;
		end
end

always @(PC)
begin
case(PC)

//-----------------------------------------------------
`ifdef PROGRAM
//-----------------------------------------------------

//li r1,0  
   0: Instruction=32'b111001_00001_00000_0000000000000000;
//swi r1,0x0001          
   1: Instruction=32'b111100_00001_00000_0000000000000001;
//li r2,8               
   2: Instruction=32'b111001_00010_00000_0000000000001000;
//swi r2,0x0000          
   3: Instruction=32'b111100_00010_00000_0000000000000000;
//lwi r9,0x0000          
   8: Instruction=32'b111011_01001_00000_0000000000000000;
//subi r5,r9,0000        
   9: Instruction=32'b110011_00101_01001_0000000000000000;
//ble r5,r1,0x11       
  10: Instruction=32'b100011_00101_00001_0000000000001010;
//li r0,1             
  11: Instruction=32'b111001_00000_00000_0000000000000001;
//mov r7,r0              
  12: Instruction=32'b010000_00111_00000_00000_00000000000;
//li r0,0             
  13: Instruction=32'b111001_00000_00000_0000000000000000;
//mov r8,r0              
  14: Instruction=32'b010000_01000_00000_00000_00000000000;
//li r4,16
  15: Instruction=32'b111001_00100_00000_0000000000010000;
//add r0,r0,r7           
  16: Instruction=32'b010010_00000_00000_00111_00000000000;
//sub r7,r0,r7           
  17: Instruction=32'b010011_00111_00000_00111_00000000000;
//subi r5,r5,0001        
  18: Instruction=32'b110011_00101_00101_0000000000000001;
//bne r5,r1,0xfffc       
  19: Instruction=32'b100001_00101_00101_1111111111111100;
//li r4,16
  20: Instruction=32'b111001_00100_00000_0000000000010000;  
//j 0xffea               
  21: Instruction=32'b000001_00000_00000_1111111111101010;

`endif
	default: Instruction= 0; //NOOP
endcase
end

endmodule
	