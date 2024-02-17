module TwoBitComparator(
    input [1:0] A, B,
    input isEqual, isGreater, isLess,
    output  reg equal,
    output  reg A_greater,
    output  reg A_less
);

    wire x,y,z,w,c;
    xnor(x, B[0], A[0]);
    xnor(y, B[1], A[1]);
    or(z, (A[1] & ~B[1]), (A[0] & ~B[0] & y));
    and(w, x , y);
    nor(c, z ,w);

always@(*)begin


if(w & isEqual)begin
       A_less = 0;
       equal = 1;
       A_greater = 0;
      end
else if((isGreater & w) | z)begin
 	A_less = 0;
        equal = 0;
        A_greater = 1;
      end
else if(c | (w & isLess))begin
 	A_less = 1;
        equal = 0;
        A_greater = 0;
      end

end
endmodule
