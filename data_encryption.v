`timescale 1ns / 1ps

module data_encryption(in1,in2,out);

input [9:0]in1,in2;
output [4:0]out;

wire [2:0]start_check;
wire [2:0]end_check;
wire correction_of_data;
wire correction_of_pureData;

assign start_check[0] = (~in1[0]) & (~in2[0]) & (1)  ;
assign start_check[1] = (~in1[1]) & (~in2[1]) & (1)  ;
assign start_check[2] = (in1[2]) & (in2[2]) & (1)  ;

assign end_check[0] = (in1[7]) & (in2[7]) & (1); 
assign end_check[1] = (~in1[8]) & (~in2[8]) & (1); 
assign end_check[2] = (~in1[9]) & (~in2[9]) & (1); 

assign correction_of_data = start_check[0] & start_check[1] & start_check[2] & end_check[0] & end_check[1] & end_check[2] ;

assign correction_of_pureData = 
   ( in1[3] ^ in2[3] ) &  ( in1[4] ^ in2[4] ) &  ( in1[5] ^ in2[5] ) &  ( in1[6] ^ in2[6] );


//0.index Show us the data was stored to output or not. 
assign out[0] = correction_of_data & correction_of_pureData;

assign out[1] = in1[3] & out[0];
assign out[2] = in1[4] & out[0];
assign out[3] = in1[5] & out[0];
assign out[4] = in1[6] & out[0];


endmodule
