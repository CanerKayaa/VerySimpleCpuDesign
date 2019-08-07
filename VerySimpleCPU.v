`timescale 1ns / 1ps

module VerySimpleCPU(clk, rst, data_fromRAM, wrEn, addr_toRAM, data_toRAM);
parameter SIZE = 14;

input clk,rst;
input wire [31:0] data_fromRAM;
output reg [SIZE-1:0] addr_toRAM;
output reg [31:0] data_toRAM;
output reg wrEn;

reg [3:0] state_current, state_next;
reg [SIZE-1:0] pc_current, pc_next;
reg [31:0] iw_current, iw_next;
reg [31:0] r1_current, r1_next;
reg [31:0] r2_current, r2_next;

always@(posedge clk) begin
	if(rst) begin
		state_current <= 0;
		iw_current <= 31'b0;
		pc_current <= 14'b0;
		r1_current <= 31'b0;
		r2_current <= 31'b0;
	end
	else begin
		state_current <= state_next;
		iw_current <= iw_next;
		pc_current <= pc_next;
		r1_current <= r1_next;
		r2_current <= r2_next;
	end
end

always@(*)begin
	state_next = state_current;
	pc_next = pc_current;
	iw_next = iw_current;
	r1_next = r1_current;
	r2_next = r2_current;
	wrEn = 0;
	addr_toRAM = 0;
	data_toRAM = 0;
	case(state_current)
		0: begin
			pc_next = 0;
			iw_next = 0;
			r1_next = 0;
			r2_next = 0;
			state_next = 1;
		end
		1:begin
			addr_toRAM = pc_current;
			state_next = 2;
		end
		2:begin
			iw_next = data_fromRAM;
			case(data_fromRAM[31:28])
				{3'b000,1'b0}: begin
					addr_toRAM = data_fromRAM[27:14];
					state_next = 3;
				end											// ADD and ADDi
				{3'b000,1'b1}: begin
					addr_toRAM = data_fromRAM[27:14];
					state_next = 4;
				end
				
				
				
				{3'b001,1'b0}: begin
					addr_toRAM = data_fromRAM[27:14];
					state_next = 3;
				end											// NAND and NANDi
				{3'b001,1'b1}: begin
					addr_toRAM = data_fromRAM[27:14];
					state_next = 4;
				end
					
					
				
				{3'b010,1'b0}: begin
					addr_toRAM = data_fromRAM[27:14];
					state_next = 3;
				end											// SLR and SLRi
				{3'b010,1'b1}: begin
					addr_toRAM = data_fromRAM[27:14];
					state_next = 4;
				end
				
				
				
				{3'b011,1'b0}: begin
					addr_toRAM = data_fromRAM[27:14];
					state_next = 3;
				end											//LT and LTi
				{3'b011,1'b1}: begin
					addr_toRAM = data_fromRAM[27:14];
					state_next = 4;
				end
				
				
				
				{3'b111,1'b0}: begin
					addr_toRAM = data_fromRAM[27:14];
					state_next = 3;
				end											// MUL and MULi
				{3'b111,1'b1}: begin
					addr_toRAM = data_fromRAM[27:14];
					state_next = 4;
				end
				
				
				
				{3'b100,1'b0}: begin
					addr_toRAM = data_fromRAM[13:0];
					state_next = 3;
				end
				{3'b100,1'b1}: begin
					addr_toRAM = data_fromRAM[13:0];
					state_next = 4;
				end											// CP, CPi, CPI and CPIi
				{3'b101,1'b0}: begin
					addr_toRAM = data_fromRAM[13:0];
					state_next = 3;
				end
				{3'b101,1'b1}: begin
					addr_toRAM = data_fromRAM[27:14];
					state_next = 3;
				end
				
				
				
				{3'b110,1'b0}: begin
					addr_toRAM = data_fromRAM[27:14];
					state_next = 3;
				end											// BZJ and BZJi
				{3'b110,1'b1}: begin
					addr_toRAM = data_fromRAM[27:14];
					state_next = 4;
				end
				
				default: begin
					pc_next = pc_current;
					state_next = 1;
				end
		endcase
	end

	3: begin
		if((iw_current[31:28]) == {3'b101,1'b0}) begin
			addr_toRAM = data_fromRAM;
			state_next = 4;
		end
		else begin
			addr_toRAM = iw_current[13:0];
			r1_next = data_fromRAM;
			state_next = 4;
		end
	end
	4: begin
			case(iw_current[31:28])
				{3'b000,1'b0}: begin 
				addr_toRAM = iw_current[27:14];
				data_toRAM = data_fromRAM + r1_current;
				pc_next = pc_current+1'b1;
				wrEn = 1;
				state_next = 1;
				end												// ADD and ADDi
				{3'b000,1'b1}: begin
				addr_toRAM = iw_current[27:14];
				data_toRAM = data_fromRAM + iw_current[13:0];
				pc_next = pc_current + 1'b1;
				wrEn = 1;
				state_next = 1;
				end
			
			
			
				{3'b001,1'b0}: begin
				addr_toRAM = iw_current[27:14];
				data_toRAM = ~(data_fromRAM & r1_current);
				pc_next = pc_current + 1'b1;
				wrEn = 1;
				state_next = 1;
				end												// NAND and NANDi
				{3'b001,1'b1}: begin
					addr_toRAM = iw_current[27:14];
					data_toRAM = ~(data_fromRAM & iw_current[13:0]);
					pc_next = pc_current + 1'b1;
					wrEn = 1;
					state_next = 1;
				end
				
				
				
				{3'b010,1'b0}: begin
					addr_toRAM = iw_current[27:14];
					data_toRAM = (data_fromRAM < 32'd32) ? (r1_current >> data_fromRAM) : (r1_current << (data_fromRAM-32'd32));
					pc_next = pc_current + 1'b1;
					wrEn =  1;
					state_next = 1;
				end												// SLR and SLRi
				{3'b010,1'b1}: begin
					addr_toRAM = iw_current[27:14];
					data_toRAM = (iw_current[13:0] < 32'd32) ? (data_fromRAM >> iw_current[13:0]) : (data_fromRAM << (iw_current[13:0]-32'd32));
					pc_next = pc_current + 1'b1;
					wrEn = 1;
					state_next = 1;
				end
				
				
				{3'b011,1'b0}: begin
					addr_toRAM = iw_current[27:14];
					data_toRAM = (r1_current < data_fromRAM) ? 1 : 0;
					pc_next = pc_current + 1'b1;
					wrEn = 1;
					state_next = 1;
				end												// LT and LTi
				{3'b011,1'b1}: begin
					addr_toRAM = iw_current[27:14];
					data_toRAM = (data_fromRAM < iw_current[13:0]) ? 1 : 0;
					pc_next = pc_current + 1'b1;
					wrEn = 1;
					state_next = 1;
				end
				
				
				
				{3'b111,1'b0}: begin
					addr_toRAM = iw_current[27:14];
					data_toRAM = (data_fromRAM * r1_current);
					pc_next = pc_current + 1'b1;
					wrEn = 1;
					state_next = 1;
				end												// MUL and MULi
				{3'b111,1'b1}: begin
					addr_toRAM = iw_current[27:14];
					data_toRAM = (data_fromRAM * iw_current[13:0]);
					pc_next = pc_current + 1'b1;
					wrEn = 1;
					state_next = 1;
				end
				
				
				
				{3'b100,1'b0}: begin
					addr_toRAM = iw_current[27:14];
					data_toRAM = r1_current;
					pc_next = pc_current + 1'b1;
					wrEn = 1;
					state_next = 1;
				end
				{3'b100,1'b1}: begin
					addr_toRAM = iw_current[27:14];
					data_toRAM = data_fromRAM;
					pc_next = pc_current + 1'b1;
					wrEn = 1;
					state_next = 1;
				end												// CP, CPi, CPI and CPIi
				{3'b101,1'b0}: begin 
					addr_toRAM = iw_current[27:14];
					data_toRAM = data_fromRAM;
					pc_next = pc_current + 1'b1;
					wrEn = 1;
					state_next = 1;
				end
				{3'b101,1'b1}: begin
					addr_toRAM = r1_current;
					data_toRAM = data_fromRAM;
					pc_next = pc_current + 1'b1;
					wrEn = 1;
					state_next = 1;
				end
				
				
				
				{3'b110,1'b0}: begin
					pc_next = (data_fromRAM == 0) ? r1_current : (pc_current + 1'b1);
					state_next = 1;
				end
				{3'b110,1'b1}: begin
					pc_next = (data_fromRAM + iw_current[13:0]);
					state_next = 1;
				end
				
			endcase
		end
	endcase
end
endmodule







