`include "verilog.v"
module verilog_tb;
    reg Motion_Sensor,Fire_Detector;
    reg [3:0]PDP1,PDP2,PDP3,UEP1,UEP2,UEP3,Remote;
    wire M;
    wire [3:0]Devices;
    main m1(Motion_Sensor,Fire_Detector,PDP1,PDP2,PDP3,UEP1,UEP2,UEP3,Remote,M,Devices);
    initial begin
        $dumpfile("verilog.vcd");
        $dumpvars(0,verilog_tb);
    end
    initial begin
    $display("                                                Smart Home Automation                                     ");
    $display("|                                                     Input                                    |  Output |");
    $display("|                          Security_Lock                  |Motion_Sensor|Fire_Detector| Remote | Devices |");
    $display("|  PDP1  |  PDP2  |  PDP3  |  UEP1  |  UEP2  |  UEP3  | M |Motion_Sensor|Fire_Detector| Remote | Devices |");
    $monitor("  %0b %0b %0b %0b  %0b %0b %0b %0b  %0b %0b %0b %0b  %0b %0b %0b %0b  %0b %0b %0b %0b  %0b %0b %0b %0b  %0b        %0b             %0b       %0b %0b %0b %0b   %0b %0b %0b %0b  ",
                PDP1[3],PDP1[2],PDP1[1],PDP1[0],PDP2[3],PDP2[2],PDP2[1],PDP2[0],PDP3[3],PDP3[2],PDP3[1],PDP3[0],UEP1[3],UEP1[2],UEP1[1],UEP1[0],UEP2[3],
                UEP2[2],UEP2[1],UEP2[0],UEP3[3],UEP3[2],UEP3[1],UEP3[0],M,Motion_Sensor,Fire_Detector,Remote[0],Remote[1],Remote[2],Remote[3],Devices[0],Devices[1],Devices[2],Devices[3]);
    PDP1=4'b0000;
    PDP2=4'b0000;
    PDP3=4'b0000;
    UEP1=4'b0000;
    UEP2=4'b0000;
    UEP3=4'b0000;
    Motion_Sensor=1'b0;
    Fire_Detector=1'b0;
    Remote=4'b0000;
    repeat(15)begin 
    #10 PDP1=$random;
    #10 PDP2=$random;
    #10 PDP3=$random;
    #10 UEP1=$random;
    #10 UEP2=$random;
    #10 UEP3=$random;
    #10 Remote=$random;
    #10 Motion_Sensor=1'b1;
    #10 Fire_Detector=1'b1;
    end
    end
    initial #2400$finish;
endmodule