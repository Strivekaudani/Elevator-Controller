`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////
//
// Munya Kaudani
// Elevator Controller top level module
//
////////////////////////////////////////////////////////////////////////////

module elevator_fsm(
		    input wire clk,
		    input wire rst_n,
		    input wire floor_one_up_btn,
		    input wire floor_two_up_btn,
		    input wire floor_two_down_btn,
		    input wire floor_three_down_btn,
		    input wire floor_one_btn,
		    input wire floor_two_btn,
		    input wire floor_three_btn,
		    output reg floor_one,
		    output reg floor_two,
		    output reg floor_three,
		    output reg elevator_open
		   );

   reg [2:0]		       state_current;
   reg [2:0]		       state_next;

   wire floor_one_up_btn_internal;
   wire floor_two_up_btn_internal;
   wire floor_two_down_btn_internal;
   wire floor_three_down_btn_internal;
   wire floor_one_btn_internal;
   wire floor_two_btn_internal;
   wire floor_three_btn_internal;

   reg			       button_pressed;
   reg			       floor_one_up_clear;
   reg			       floor_two_up_clear;
   reg			       floor_two_down_clear;
   reg			       floor_three_down_clear;
   reg			       floor_one_clear;
   reg			       floor_two_clear;
   reg			       floor_three_clear;

   parameter [2:0]	       S0_IDLE = 3'b000;
   parameter [2:0]	       S1_GOING_UP = 3'b001;
   parameter [2:0]	       S2_GOING_DOWN = 3'b010;
   parameter [2:0]	       S3_FLOOR_ONE = 3'b011;
   parameter [2:0]	       S4_FLOOR_TWO = 3'b100;
   parameter [2:0]	       S5_FLOOR_THREE = 3'b101;

   elevator_button floor_one_button (
				     .clk(clk), 
				     .rst_n(rst_n), 
				     .button_pressed(floor_one_btn), 
				     .clear(floor_one_clear), 
				     .button_out(floor_one_btn_internal)
				     );
   
   elevator_button floor_two_button (
				     .clk(clk), 
				     .rst_n(rst_n), 
				     .button_pressed(floor_two_btn), 
				     .clear(floor_two_clear), 
				     .button_out(floor_two_btn_internal)
				     );
   
   elevator_button floor_three_button (
				       .clk(clk), 
				       .rst_n(rst_n), 
				       .button_pressed(floor_three_btn), 
				       .clear(floor_three_clear), 
				       .button_out(floor_three_btn_internal)
				       );
   
   elevator_button floor_one_up_button (
					.clk(clk), 
					.rst_n(rst_n), 
					.button_pressed(floor_one_up_btn), 
					.clear(floor_one_up_clear), 
					.button_out(floor_one_up_btn_internal)
					);
   
   elevator_button floor_two_up_button (
					.clk(clk), 
					.rst_n(rst_n), 
					.button_pressed(floor_two_up_btn), 
					.clear(floor_two_up_clear), 
					.button_out(floor_two_up_btn_internal)
					);
   
   elevator_button floor_two_down_button (
					  .clk(clk), 
					  .rst_n(rst_n), 
					  .button_pressed(floor_two_down_btn), 
					  .clear(floor_two_down_clear), 
					  .button_out(floor_two_down_btn_internal)
					  );
   
   elevator_button floor_three_down_button (
					    .clk(clk), 
					    .rst_n(rst_n), 
					    .button_pressed(floor_three_down_btn), 
					    .clear(floor_three_down_clear), 
					    .button_out(floor_three_down_btn_internal)
					    );

   //sequential logic
   always @(posedge clk or negedge rst_n)
     begin
	if(rst_n == 1'b0)begin
	   state_current <= S0_IDLE;
	end else begin
	   state_current <= state_next;
	end
     end

   //combinational logic for next logic state
   always @(*)
     begin

	state_next = state_current;
	button_pressed = 1'b0;
	
	if(floor_one_btn_internal == 1'b1 | floor_two_btn_internal == 1'b1 | floor_three_btn_internal == 1'b1 | floor_one_up_btn_internal == 1'b1 | floor_two_up_btn_internal == 1'b1 | floor_two_down_btn_internal == 1'b1 | floor_three_down_btn_internal == 1'b1)begin
		button_pressed = 1'b1;
	end

	case(state_current)
	  S0_IDLE: begin
	     if (button_pressed == 1'b1) begin
		if(floor_one_up_btn_internal == 1'b1)begin
		   state_next = S3_FLOOR_ONE;
		end else if (floor_two_up_btn_internal == 1'b1)begin
		   state_next = S4_FLOOR_TWO;
		end else if (floor_two_down_btn_internal == 1'b1)begin
		   state_next = S4_FLOOR_TWO;
		end else if (floor_three_down_btn_internal == 1'b1)begin
		   state_next = S5_FLOOR_THREE;
		end
	     end else begin
		   state_next = S0_IDLE;
	     end
	  end // case: S0_IDLE

	  S1_GOING_UP: begin
	     if(floor_two_up_btn_internal == 1'b1)begin
		state_next = S4_FLOOR_TWO;
	     end else if(floor_two_down_btn_internal == 1'b1)begin
		state_next = S4_FLOOR_TWO;
	     end else if(floor_three_down_btn_internal == 1'b1)begin
		state_next = S5_FLOOR_THREE;
	     end else if(floor_two_btn_internal == 1'b1)begin
		state_next = S4_FLOOR_TWO;
	     end else if(floor_three_btn_internal == 1'b1)begin
		state_next = S5_FLOOR_THREE;
	     end
	  end

	  S2_GOING_DOWN: begin
	     if(floor_one_up_btn_internal == 1'b1)begin
		state_next = S3_FLOOR_ONE;
	     end else if(floor_two_up_btn_internal == 1'b1)begin
		state_next = S4_FLOOR_TWO;
	     end else if(floor_two_down_btn_internal == 1'b1)begin
		state_next = S4_FLOOR_TWO;
	     end else if(floor_one_btn_internal == 1'b1)begin
		state_next = S3_FLOOR_ONE;
	     end else if(floor_two_btn_internal == 1'b1)begin
		state_next = S4_FLOOR_TWO;
	     end
	  end

	  S3_FLOOR_ONE: begin
	     if(button_pressed == 1'b0)begin
		state_next = S0_IDLE;
	     end else if(floor_two_up_btn_internal == 1'b1)begin
		state_next = S1_GOING_UP;
	     end else if(floor_two_down_btn_internal == 1'b1)begin
		state_next = S1_GOING_UP;
	     end else if(floor_three_down_btn_internal == 1'b1)begin
		state_next = S1_GOING_UP;
	     end else if(floor_two_btn_internal == 1'b1)begin
		state_next = S1_GOING_UP;
	     end else if(floor_three_btn_internal == 1'b1)begin
		state_next = S1_GOING_UP;
	     end
	  end

	  S4_FLOOR_TWO: begin
	     if(button_pressed == 1'b0)begin
		state_next = S0_IDLE;
	     end else if(floor_one_up_btn_internal == 1'b1)begin
		state_next = S2_GOING_DOWN;
	     end else if(floor_three_down_btn_internal == 1'b1)begin
		state_next = S1_GOING_UP;
	     end else if(floor_one_btn_internal == 1'b1)begin
		state_next = S2_GOING_DOWN;
	     end else if(floor_three_btn_internal == 1'b1)begin
		state_next = S1_GOING_UP;
	     end
	  end

	  S5_FLOOR_THREE: begin
	     if(button_pressed == 1'b0)begin
		state_next = S0_IDLE;
	     end else if(floor_one_up_btn_internal == 1'b1)begin
		state_next = S2_GOING_DOWN;
	     end else if(floor_two_up_btn_internal == 1'b1)begin
		state_next = S2_GOING_DOWN;
	     end else if(floor_two_down_btn_internal == 1'b1)begin
		state_next = S2_GOING_DOWN;
	     end else if(floor_one_btn_internal == 1'b1)begin
		state_next = S2_GOING_DOWN;
	     end else if(floor_two_btn_internal == 1'b1)begin
		state_next = S2_GOING_DOWN;
	     end
	  end // case: S5_FLOOR_THREE
	  
	  default: begin
	      if(button_pressed == 1'b1) begin
		if(floor_one_up_btn_internal == 1'b1) begin
		   state_next = S3_FLOOR_ONE;
		end else if (floor_two_up_btn_internal == 1'b1) begin
		   state_next = S4_FLOOR_TWO;
		end else if (floor_two_down_btn_internal == 1'b1) begin
		   state_next = S4_FLOOR_TWO;
		end else if (floor_three_down_btn_internal == 1'b1) begin
		   state_next = S5_FLOOR_THREE;
		end
	      end else begin
		   state_next = S0_IDLE;
	      end
	  end
	endcase 
     end

   //output logic
   always @(*)
     begin

	floor_one = 1'b0;
	floor_two = 1'b0;
	floor_three = 1'b0;
	elevator_open = 1'b0;
	floor_one_clear = 1'b0;
	floor_two_clear = 1'b0;
	floor_three_clear = 1'b0;
	floor_one_up_clear = 1'b0;
	floor_two_up_clear = 1'b0;
	floor_two_down_clear = 1'b0;
	floor_three_down_clear = 1'b0;
	
	case(state_current)
	  		  
	  S1_GOING_UP: begin
	     elevator_open = 1'b0;
	  end

	  S2_GOING_DOWN: begin
	     elevator_open = 1'b0;
	  end

	  S3_FLOOR_ONE: begin
	     floor_one = 1'b1;
	     if(floor_one_btn_internal == 1'b1)begin
		elevator_open = 1'b1;
		floor_one_clear = 1'b1;
	     end else if(floor_one_up_btn_internal == 1'b1)begin
		elevator_open = 1'b1;
		floor_one_up_clear = 1'b1;
	     end
	  end

	  S4_FLOOR_TWO: begin
	     floor_two = 1'b1;
	     if(floor_two_btn_internal == 1'b1)begin
		elevator_open = 1'b1;
		floor_two_clear = 1'b1;
	     end else if(floor_two_up_btn_internal == 1'b1)begin
		elevator_open = 1'b1;
		floor_two_up_clear = 1'b1;
	     end else if(floor_two_down_btn_internal == 1'b1)begin
		elevator_open = 1'b1;
		floor_two_down_clear = 1'b1;
	     end
	  end // case: S4_FLOOR_TWO

	  S5_FLOOR_THREE: begin
	     floor_three = 1'b1;
	     if(floor_three_btn_internal == 1'b1)begin
		elevator_open = 1'b1;
		floor_three_clear = 1'b1;
	     end else if(floor_three_down_btn_internal == 1'b1)begin
		elevator_open = 1'b1;
		floor_three_down_clear = 1'b1;
	     end
	  end
	  
	  default: begin
	     floor_one = 1'b1;
	     if(floor_one_btn_internal == 1'b1)begin
		elevator_open = 1'b1;
		floor_one_clear = 1'b1;
	     end else if(floor_one_up_btn_internal == 1'b1)begin
		elevator_open = 1'b1;
		floor_one_up_clear = 1'b1;
	     end
	  end // case: Default
	endcase
     end // always@ (*)
endmodule // elevator_fsm
