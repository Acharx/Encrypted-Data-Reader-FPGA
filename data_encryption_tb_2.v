`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2023 20:11:00
// Design Name: 
// Module Name: data_encryption_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module data_encryption_tb_2;

reg [9:0]in1,in2;
wire [4:0]out;

data_encryption UUT(
.in1(in1),
.in2(in2),
.out(out)
);

initial begin

in1 = 10'b0010001100;
in2 = 10'b0010010100;
end

// Result 0 0000 ==> 00000

endmodule
