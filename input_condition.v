module input_condition(Clock,pulse,a);

input a,Clock;
output pulse;
reg[1:0] y,Y;
parameter A = 2'b00, B = 2'b01, C = 2'b10;

always @(a,y)
begin
	case(y)
		A: if(a == 0)
				Y = A;
			else
				Y = B;
		B: if(a == 0)
				Y = A;
			else
				Y = C;
		C: if(a == 0)
				Y = A;
			else
				Y = C;
		default: Y= 2'bxx;
	endcase
end


always @(posedge Clock)
begin
	y <= Y;
end

assign pulse = (y == B);

endmodule

