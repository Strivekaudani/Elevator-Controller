`timescale 1ns / 1ps

module elevator_fsm_tb();

   reg clk;
   reg rst_n;
   reg floor_one_up_btn;
   reg floor_two_up_btn;
   reg floor_two_down_btn;
   reg floor_three_down_btn;
   reg elevator_floor_one_btn;
   reg elevator_floor_two_btn;
   reg elevator_floor_three_btn;
   wire	floor_one;
   wire	floor_two;
   wire	floor_three;
   wire	elevator_open;

   reg [8*39:0]	testcase;
   
   elevator_fsm DUT(
		    .clk(clk),
		    .rst_n(rst_n),
		    .floor_one_up_btn(floor_one_up_btn),
		    .floor_two_up_btn(floor_two_up_btn),
		    .floor_two_down_btn(floor_two_down_btn),
		    .floor_three_down_btn(floor_three_down_btn),
		    .floor_one_btn(elevator_floor_one_btn),
		    .floor_two_btn(elevator_floor_two_btn),
		    .floor_three_btn(elevator_floor_three_btn),
		    .floor_one(floor_one),
		    .floor_two(floor_two),
		    .floor_three(floor_three),
		    .elevator_open(elevator_open)
		   );

   always #5 clk = ~clk;

   initial begin
      clk = 0;
      rst_n = 0;
      floor_one_up_btn = 0;
      floor_two_up_btn = 0;
      floor_two_down_btn = 0;
      floor_three_down_btn = 0;
      elevator_floor_one_btn = 0;
      elevator_floor_two_btn = 0;
      elevator_floor_three_btn = 0;

      $monitor("Testcase: %s, floor_one = %b, floor_two = %b, floor_three = %b, elevator_open = %b, Time = %t", testcase, floor_one, floor_two, floor_three, elevator_open, $time);
      

      //reset
      #23
	rst_n = 1;
      #10

      //Testing Floor 1 to Floor 2
	testcase = "Floor 1 -> Floor 2";
	floor_one_up_btn = 1;
      #10
	floor_one_up_btn = 0;
	elevator_floor_two_btn = 1;
      #10
	elevator_floor_two_btn = 0;
      #30

      //Testing Floor 1 to Floor 3
	testcase = "Floor 1 -> Floor 3";
	floor_one_up_btn = 1;
      #10
	floor_one_up_btn = 0;
	elevator_floor_three_btn = 1;
      #10
	elevator_floor_three_btn = 0;
      #30

      //Testing Floor 2 to Floor 3
	testcase = "Floor 2 -> Floor 3";
	floor_two_up_btn = 1;
      #10
	floor_two_up_btn = 0;
	elevator_floor_three_btn = 1;
      #10
	elevator_floor_three_btn = 0;
      #30

      //Testing Floor 2 to Floor 1
	testcase = "Floor 2 -> Floor 1";
	floor_two_down_btn = 1;
      #10
	floor_two_down_btn = 0;
	elevator_floor_one_btn = 1;
      #10
	elevator_floor_one_btn = 0;
      #30

      //Testing Floor 3 to Floor 2
	testcase = "Floor 3 -> Floor 2";
	floor_three_down_btn = 1;
      #10
	floor_three_down_btn = 0;
	elevator_floor_two_btn = 1;
      #10
	elevator_floor_two_btn = 0;
      #30

      //Testing Floor 3 to Floor 1
	testcase = "Floor 3 -> Floor 1";
	floor_three_down_btn = 1;
      #10
	floor_three_down_btn = 0;
	elevator_floor_one_btn = 1;
      #10
	elevator_floor_one_btn = 0;
      #30

      //Testing Floor 1 to Floor 3 with pick up on Floor 2
	testcase = "Floor 1 -> Floor 3 w/ pickup on Floor 2";
	floor_one_up_btn = 1;
      #10
	floor_one_up_btn = 0;
	//floor_two_up_btn = 1;
	elevator_floor_three_btn = 1;
      #10
	//floor_two_up_btn = 0;
	floor_two_up_btn = 1;
	elevator_floor_three_btn = 0;
      #10
	//elevator_floor_three_btn = 0;
	floor_two_up_btn = 0;
      #50

      //Testing Floor 3 to Floor 1 with pick up on Floor 2
	testcase = "Floor 3 -> Floor 1 w/ pickup on Floor 2";
	floor_three_down_btn = 1;
      #10
	floor_three_down_btn = 0;
	floor_two_down_btn = 1;
      #10
	floor_two_down_btn = 0;
	elevator_floor_one_btn = 1;
      #10
	elevator_floor_one_btn = 0;
      #20

      #50
	$finish;
   end // initial begin

endmodule // elevator_fsm_tb
