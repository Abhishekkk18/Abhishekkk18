module main(Motion_Sensor,Fire_Detector,PDP1,PDP2,PDP3,UEP1,UEP2,UEP3,Remote,M,Devices);
    input Motion_Sensor,Fire_Detector;
    input [3:0]PDP1,PDP2,PDP3,UEP1,UEP2,UEP3,Remote;
    output M;
    output [3:0]Devices;
    wire N;
    wire [3:0]O;
    security_lock SL1(PDP1,PDP2,PDP3,UEP1,UEP2,UEP3,M);
    and(N,Motion_Sensor,M);
    and(O[0],M,Remote[0]);
    and(O[1],M,Remote[1]);
    and(O[2],M,Remote[2]);
    and(O[3],M,Remote[3]);
    xor(Devices[0],N,O[0]);
    xor(Devices[1],N,O[1]);
    xor(Devices[2],N,O[2]);
    xor(Devices[3],N,O[3]);
endmodule

module security_lock(PDP1,PDP2,PDP3,UEP1,UEP2,UEP3,Out);
    input [3:0]PDP1,PDP2,PDP3,UEP1,UEP2,UEP3;
    output Out;
    wire [2:0]X;
    wire [1:0]Invalid1,Invalid2,Invalid3;
    four_bit_comparator FBC1(PDP1,UEP1,X[0],{Invalid1[1],Invalid1[0]});
    four_bit_comparator FBC2(PDP2,UEP3,X[1],{Invalid2[1],Invalid2[0]});
    four_bit_comparator FBC3(PDP3,UEP3,X[2],{Invalid3[1],Invalid3[0]});
    and(Out,X[0],X[1],X[2]);
endmodule

module four_bit_comparator(A,B,Correct,Invalid);
    input [3:0]A,B;
    output Correct;
    output [1:0]Invalid;
    wire [3:0]W;
    wire [1:0]P,Q;
    xnor(W[0],A[0],B[0]);
    xnor(W[1],A[1],B[1]);
    xnor(W[2],A[2],B[2]);
    xnor(W[3],A[3],B[3]);
    and(Correct,W[3],W[2],W[1],W[0]);
    and(P[0],A[3],A[2]);
    and(P[1],A[3],A[1]);
    or(Invalid[0],P[1],P[0]);
    and(Q[0],B[3],B[2]);
    and(Q[1],B[3],B[1]);
    or(Invalid[1],Q[1],Q[0]);
endmodule