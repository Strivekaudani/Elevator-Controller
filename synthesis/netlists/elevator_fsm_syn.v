/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Sun Nov  5 20:11:38 2023
/////////////////////////////////////////////////////////////


module elevator_button_6 ( clk, rst_n, button_pressed, clear, button_out );
  input clk, rst_n, button_pressed, clear;
  output button_out;
  wire   n5, n1, n2, n3;

  DFFR_E button_out_reg ( .D(n2), .CLK(clk), .RN(rst_n), .Q(n5) );
  INVERT_N U3 ( .A(n3), .Z(button_out) );
  NOR2_C U4 ( .A(clear), .B(n1), .Z(n2) );
  NOR2_D U5 ( .A(button_out), .B(button_pressed), .Z(n1) );
  INVERT_I U6 ( .A(n5), .Z(n3) );
endmodule


module elevator_button_0 ( clk, rst_n, button_pressed, clear, button_out );
  input clk, rst_n, button_pressed, clear;
  output button_out;
  wire   n7, n3, n5, n6;

  DFFR_E button_out_reg ( .D(n5), .CLK(clk), .RN(rst_n), .Q(n7) );
  NOR2_C U3 ( .A(button_out), .B(button_pressed), .Z(n6) );
  INVERT_L U4 ( .A(n3), .Z(button_out) );
  NOR2_C U5 ( .A(clear), .B(n6), .Z(n5) );
  INVERT_H U6 ( .A(n7), .Z(n3) );
endmodule


module elevator_button_1 ( clk, rst_n, button_pressed, clear, button_out );
  input clk, rst_n, button_pressed, clear;
  output button_out;
  wire   n7, n3, n5, n6;

  DFFR_E button_out_reg ( .D(n5), .CLK(clk), .RN(rst_n), .Q(n7), .QBAR(n3) );
  NOR2_C U3 ( .A(clear), .B(n6), .Z(n5) );
  NOR2_D U4 ( .A(n7), .B(button_pressed), .Z(n6) );
  INVERT_I U5 ( .A(n3), .Z(button_out) );
endmodule


module elevator_button_2 ( clk, rst_n, button_pressed, clear, button_out );
  input clk, rst_n, button_pressed, clear;
  output button_out;
  wire   n7, n3, n5, n6;

  DFFR_E button_out_reg ( .D(n5), .CLK(clk), .RN(rst_n), .Q(n7) );
  INVERT_K U3 ( .A(n3), .Z(button_out) );
  NOR2_C U4 ( .A(clear), .B(n6), .Z(n5) );
  NOR2_C U5 ( .A(button_out), .B(button_pressed), .Z(n6) );
  INVERT_H U6 ( .A(n7), .Z(n3) );
endmodule


module elevator_button_3 ( clk, rst_n, button_pressed, clear, button_out );
  input clk, rst_n, button_pressed, clear;
  output button_out;
  wire   n7, n4, n5, n6;

  DFFR_E button_out_reg ( .D(n5), .CLK(clk), .RN(rst_n), .Q(n7), .QBAR(n4) );
  INVERT_J U3 ( .A(n4), .Z(button_out) );
  NOR2_C U4 ( .A(n6), .B(clear), .Z(n5) );
  NOR2_D U5 ( .A(n7), .B(button_pressed), .Z(n6) );
endmodule


module elevator_button_4 ( clk, rst_n, button_pressed, clear, button_out );
  input clk, rst_n, button_pressed, clear;
  output button_out;
  wire   n7, n3, n5, n6;

  NOR2_D U3 ( .A(clear), .B(n6), .Z(n5) );
  DFFR_E button_out_reg ( .D(n5), .CLK(clk), .RN(rst_n), .Q(n7), .QBAR(n3) );
  NOR2_D U4 ( .A(n7), .B(button_pressed), .Z(n6) );
  INVERT_I U5 ( .A(n3), .Z(button_out) );
endmodule


module elevator_button_5 ( clk, rst_n, button_pressed, clear, button_out );
  input clk, rst_n, button_pressed, clear;
  output button_out;
  wire   n7, n3, n5, n6;

  NOR2_D U3 ( .A(clear), .B(n6), .Z(n5) );
  DFFR_E button_out_reg ( .D(n5), .CLK(clk), .RN(rst_n), .Q(n7) );
  NOR2_D U4 ( .A(button_out), .B(button_pressed), .Z(n6) );
  INVERT_I U5 ( .A(n7), .Z(n3) );
  INVERT_M U6 ( .A(n3), .Z(button_out) );
endmodule


module elevator_fsm ( clk, rst_n, floor_one_up_btn, floor_two_up_btn, 
        floor_two_down_btn, floor_three_down_btn, floor_one_btn, floor_two_btn, 
        floor_three_btn, floor_one, floor_two, floor_three, elevator_open );
  input clk, rst_n, floor_one_up_btn, floor_two_up_btn, floor_two_down_btn,
         floor_three_down_btn, floor_one_btn, floor_two_btn, floor_three_btn;
  output floor_one, floor_two, floor_three, elevator_open;
  wire   n214, n215, n216, floor_one_clear, floor_one_btn_internal,
         floor_two_btn_internal, floor_three_btn_internal, floor_one_up_clear,
         floor_one_up_btn_internal, floor_two_up_btn_internal,
         floor_two_down_clear, floor_two_down_btn_internal,
         floor_three_down_clear, floor_three_down_btn_internal, n1, n3, n4, n6,
         n7, n10, n11, n12, n13, n213, n16, n17, n18, n19, n20, n21, n22, n23,
         n25, n26, n27, n29, n30, n31, n32, n33, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n128, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212;
  wire   [2:0] state_current;
  wire   [2:0] state_next;

  elevator_button_6 floor_one_button ( .clk(clk), .rst_n(n69), 
        .button_pressed(floor_one_btn), .clear(floor_one_clear), .button_out(
        floor_one_btn_internal) );
  elevator_button_5 floor_two_button ( .clk(clk), .rst_n(n69), 
        .button_pressed(floor_two_btn), .clear(n116), .button_out(
        floor_two_btn_internal) );
  elevator_button_4 floor_three_button ( .clk(clk), .rst_n(n69), 
        .button_pressed(floor_three_btn), .clear(n182), .button_out(
        floor_three_btn_internal) );
  elevator_button_3 floor_one_up_button ( .clk(clk), .rst_n(n69), 
        .button_pressed(floor_one_up_btn), .clear(floor_one_up_clear), 
        .button_out(floor_one_up_btn_internal) );
  elevator_button_2 floor_two_up_button ( .clk(clk), .rst_n(n69), 
        .button_pressed(floor_two_up_btn), .clear(n65), .button_out(
        floor_two_up_btn_internal) );
  elevator_button_1 floor_two_down_button ( .clk(clk), .rst_n(n69), 
        .button_pressed(floor_two_down_btn), .clear(floor_two_down_clear), 
        .button_out(floor_two_down_btn_internal) );
  elevator_button_0 floor_three_down_button ( .clk(clk), .rst_n(n69), 
        .button_pressed(floor_three_down_btn), .clear(floor_three_down_clear), 
        .button_out(floor_three_down_btn_internal) );
  NAND2_D U11 ( .A(n31), .B(n167), .Z(n18) );
  NAND2_D U24 ( .A(n125), .B(n97), .Z(state_next[0]) );
  NOR2_D U43 ( .A(n166), .B(n169), .Z(n57) );
  INVERT_D U68 ( .A(floor_two_up_btn_internal), .Z(n11) );
  DFFR_E \state_current_reg[1]  ( .D(n62), .CLK(clk), .RN(n69), .Q(
        state_current[1]), .QBAR(n67) );
  DFFR_E \state_current_reg[0]  ( .D(state_next[0]), .CLK(clk), .RN(n69), .Q(
        state_current[0]), .QBAR(n66) );
  DFFR_E \state_current_reg[2]  ( .D(state_next[2]), .CLK(clk), .RN(n69), .Q(
        state_current[2]), .QBAR(n64) );
  INVERT_E U75 ( .A(n107), .Z(n134) );
  INVERT_E U76 ( .A(n96), .Z(n119) );
  INVERT_I U77 ( .A(state_current[1]), .Z(n197) );
  INVERT_E U78 ( .A(n102), .Z(n100) );
  INVERT_H U79 ( .A(n201), .Z(n199) );
  INVERT_E U80 ( .A(n86), .Z(n136) );
  INVERT_E U81 ( .A(n115), .Z(n181) );
  INVERT_I U82 ( .A(n206), .Z(n202) );
  INVERT_E U83 ( .A(n113), .Z(n111) );
  INVERT_I U84 ( .A(n64), .Z(n171) );
  INVERT_H U85 ( .A(n187), .Z(n188) );
  INVERT_H U86 ( .A(n213), .Z(n187) );
  INVERT_E U87 ( .A(n87), .Z(n47) );
  INVERT_E U88 ( .A(n74), .Z(n77) );
  INVERT_J U89 ( .A(n178), .Z(n176) );
  BUFFER_I U90 ( .A(n216), .Z(n178) );
  INVERT_I U91 ( .A(rst_n), .Z(n68) );
  INVERT_H U92 ( .A(n198), .Z(n16) );
  INVERT_H U93 ( .A(floor_one_up_btn_internal), .Z(n10) );
  OR2_H U94 ( .A(n78), .B(n79), .Z(n62) );
  INVERT_D U95 ( .A(n75), .Z(n97) );
  NAND2_F U96 ( .A(floor_two_btn_internal), .B(n3), .Z(n27) );
  INVERT_I U97 ( .A(floor_one_btn_internal), .Z(n3) );
  OA21_H U98 ( .A1(floor_one_up_btn_internal), .A2(n43), .B(n212), .Z(n63) );
  NAND2_E U99 ( .A(floor_one_up_btn_internal), .B(n66), .Z(n36) );
  INVERT_H U100 ( .A(n55), .Z(n116) );
  NOR2_D U101 ( .A(n158), .B(n159), .Z(n153) );
  NAND2_E U102 ( .A(floor_three_btn_internal), .B(n200), .Z(n56) );
  AND2_H U103 ( .A(floor_two_up_btn_internal), .B(n138), .Z(n65) );
  INVERT_I U104 ( .A(n17), .Z(n191) );
  NOR2_D U105 ( .A(n121), .B(n122), .Z(n43) );
  INVERT_N U106 ( .A(n68), .Z(n69) );
  INVERT_H U107 ( .A(n10), .Z(n70) );
  INVERT_I U108 ( .A(n70), .Z(n71) );
  OR2_J U109 ( .A(n190), .B(n73), .Z(n30) );
  INVERT_H U110 ( .A(n32), .Z(n72) );
  INVERT_H U111 ( .A(n72), .Z(n73) );
  AOI21_B U112 ( .A1(n50), .A2(n198), .B(n114), .Z(n46) );
  NAND2BAL_E U113 ( .A(n101), .B(n208), .Z(n50) );
  OA21_F U114 ( .A1(floor_one_btn_internal), .A2(n73), .B(n200), .Z(n33) );
  INVERT_D U115 ( .A(n33), .Z(n74) );
  OA222_E U116 ( .A1(n46), .A2(n175), .B1(n16), .B2(n71), .C1(
        floor_one_up_btn_internal), .C2(n47), .Z(n45) );
  CLKI_I U117 ( .A(n45), .Z(n75) );
  INVERT_F U118 ( .A(n36), .Z(n76) );
  NOR2_C U119 ( .A(n76), .B(n77), .Z(n80) );
  INVERT_E U120 ( .A(n80), .Z(n78) );
  NOR2_C U121 ( .A(n63), .B(n35), .Z(n81) );
  INVERT_E U122 ( .A(n81), .Z(n79) );
  NOR2_C U123 ( .A(n82), .B(n83), .Z(n35) );
  INVERT_E U124 ( .A(n38), .Z(n84) );
  INVERT_D U125 ( .A(n37), .Z(n82) );
  NOR2_C U126 ( .A(n67), .B(n84), .Z(n85) );
  INVERT_E U127 ( .A(n85), .Z(n83) );
  INVERT_N U128 ( .A(n197), .Z(n198) );
  AND2_H U129 ( .A(floor_two_btn_internal), .B(n196), .Z(n209) );
  INVERT_D U130 ( .A(n209), .Z(n86) );
  NOR2_C U131 ( .A(n48), .B(n1), .Z(n88) );
  NOR2_C U132 ( .A(n204), .B(n1), .Z(n89) );
  NOR2_C U133 ( .A(n88), .B(n89), .Z(n87) );
  INVERT_H U134 ( .A(n202), .Z(n204) );
  INVERT_E U135 ( .A(n103), .Z(n48) );
  INVERT_F U136 ( .A(n152), .Z(n1) );
  INVERT_D U137 ( .A(n196), .Z(n157) );
  INVERT_H U138 ( .A(n23), .Z(n90) );
  INVERT_H U139 ( .A(n90), .Z(n91) );
  OA21_F U140 ( .A1(n196), .A2(n22), .B(n91), .Z(n21) );
  INVERT_D U141 ( .A(n21), .Z(n92) );
  OA21_F U142 ( .A1(n20), .A2(n92), .B(n71), .Z(n19) );
  INVERT_D U143 ( .A(n19), .Z(n93) );
  INVERT_H U144 ( .A(n112), .Z(n189) );
  NOR2_C U145 ( .A(n190), .B(n172), .Z(n95) );
  NOR2_C U146 ( .A(n95), .B(n198), .Z(n94) );
  INVERT_K U147 ( .A(n189), .Z(n190) );
  OA21_F U148 ( .A1(floor_one_btn_internal), .A2(n190), .B(n212), .Z(n25) );
  INVERT_D U149 ( .A(n25), .Z(n96) );
  NOR2_C U150 ( .A(n126), .B(n98), .Z(floor_one_up_clear) );
  NOR2_C U151 ( .A(n71), .B(floor_one_btn_internal), .Z(n99) );
  INVERT_E U152 ( .A(n99), .Z(n98) );
  NOR2_C U153 ( .A(n212), .B(n196), .Z(n40) );
  INVERT_D U154 ( .A(n37), .Z(n156) );
  INVERT_E U155 ( .A(n100), .Z(n101) );
  AND2_H U156 ( .A(n212), .B(floor_three_down_btn_internal), .Z(n207) );
  INVERT_D U157 ( .A(n207), .Z(n102) );
  NOR2_C U158 ( .A(floor_one_btn_internal), .B(n7), .Z(n104) );
  INVERT_D U159 ( .A(n13), .Z(n105) );
  NOR2_C U160 ( .A(n104), .B(n105), .Z(n103) );
  INVERT_J U161 ( .A(floor_three_btn_internal), .Z(n7) );
  DELAY4_F U162 ( .A(n18), .Z(n106) );
  INVERT_H U163 ( .A(n60), .Z(n180) );
  AOI22_D U164 ( .A1(n200), .A2(floor_three_down_btn_internal), .B1(n203), 
        .B2(n174), .Z(n60) );
  AND2_H U165 ( .A(floor_one_btn_internal), .B(n151), .Z(n210) );
  INVERT_D U166 ( .A(n210), .Z(n107) );
  AND2_H U167 ( .A(n31), .B(n4), .Z(n52) );
  INVERT_D U168 ( .A(n52), .Z(n108) );
  INVERT_H U169 ( .A(n211), .Z(n208) );
  NAND2BAL_E U170 ( .A(n137), .B(n135), .Z(n211) );
  AO21_E U171 ( .A1(n4), .A2(n7), .B(floor_three_down_btn_internal), .Z(n39)
         );
  INVERT_D U172 ( .A(n39), .Z(n109) );
  INVERT_H U173 ( .A(n56), .Z(n182) );
  AOI21_B U174 ( .A1(n152), .A2(n29), .B(n172), .Z(n20) );
  OAI21_C U175 ( .A1(floor_one_btn_internal), .A2(n167), .B(n198), .Z(n29) );
  INVERT_E U176 ( .A(n164), .Z(n162) );
  INVERT_H U177 ( .A(n30), .Z(n110) );
  INVERT_H U178 ( .A(n170), .Z(n168) );
  INVERT_H U179 ( .A(n202), .Z(n203) );
  INVERT_H U180 ( .A(n202), .Z(n205) );
  INVERT_E U181 ( .A(n111), .Z(n112) );
  AND2_H U182 ( .A(n13), .B(n7), .Z(n26) );
  INVERT_D U183 ( .A(n26), .Z(n113) );
  OA21_F U184 ( .A1(n194), .A2(n108), .B(n91), .Z(n51) );
  INVERT_D U185 ( .A(n51), .Z(n114) );
  OA21_F U186 ( .A1(n61), .A2(n166), .B(n163), .Z(n59) );
  INVERT_D U187 ( .A(n59), .Z(n115) );
  INVERT_I U188 ( .A(n171), .Z(n172) );
  INVERT_K U189 ( .A(n199), .Z(n200) );
  INVERT_I U190 ( .A(floor_three_down_btn_internal), .Z(n13) );
  INVERT_E U191 ( .A(n173), .Z(n174) );
  AO222_F U192 ( .A1(n212), .A2(n109), .B1(n27), .B2(n40), .C1(n6), .C2(n41), 
        .Z(n38) );
  INVERT_D U193 ( .A(n190), .Z(n6) );
  NOR2_C U194 ( .A(n117), .B(n118), .Z(n22) );
  NOR2_C U195 ( .A(n94), .B(n27), .Z(n117) );
  INVERT_E U196 ( .A(n175), .Z(n120) );
  NOR2_C U197 ( .A(n119), .B(n120), .Z(n118) );
  CLKI_O U198 ( .A(n173), .Z(n175) );
  INVERT_E U199 ( .A(floor_one_btn_internal), .Z(n123) );
  INVERT_D U200 ( .A(n13), .Z(n121) );
  NOR2_C U201 ( .A(n123), .B(n198), .Z(n124) );
  INVERT_E U202 ( .A(n124), .Z(n122) );
  BUFFER_F U203 ( .A(n44), .Z(n125) );
  AOI22_B U204 ( .A1(n169), .A2(n175), .B1(n76), .B2(n172), .Z(n44) );
  INVERT_K U205 ( .A(n188), .Z(n126) );
  INVERT_O U206 ( .A(n126), .Z(floor_one) );
  INVERT_K U207 ( .A(n200), .Z(n128) );
  INVERT_O U208 ( .A(n128), .Z(floor_three) );
  NOR2_C U209 ( .A(n13), .B(n130), .Z(floor_three_down_clear) );
  INVERT_H U210 ( .A(n7), .Z(n131) );
  NOR2_C U211 ( .A(n128), .B(n131), .Z(n132) );
  INVERT_E U212 ( .A(n132), .Z(n130) );
  INVERT_E U213 ( .A(n171), .Z(n133) );
  INVERT_E U214 ( .A(n134), .Z(n135) );
  INVERT_E U215 ( .A(n136), .Z(n137) );
  NAND2BAL_E U216 ( .A(n204), .B(n4), .Z(n139) );
  INVERT_F U217 ( .A(n139), .Z(n138) );
  INVERT_K U218 ( .A(floor_two_btn_internal), .Z(n4) );
  INVERT_K U219 ( .A(n205), .Z(n140) );
  INVERT_O U220 ( .A(n140), .Z(floor_two) );
  INVERT_F U221 ( .A(n140), .Z(n142) );
  INVERT_E U222 ( .A(n143), .Z(n215) );
  INVERT_E U223 ( .A(n196), .Z(n144) );
  NOR2_C U224 ( .A(n144), .B(n145), .Z(n143) );
  NOR2_C U225 ( .A(n133), .B(n198), .Z(n146) );
  INVERT_E U226 ( .A(n146), .Z(n145) );
  INVERT_H U227 ( .A(n57), .Z(n147) );
  INVERT_H U228 ( .A(n147), .Z(n148) );
  INVERT_H U229 ( .A(state_current[2]), .Z(n149) );
  INVERT_I U230 ( .A(n149), .Z(n150) );
  AND2_I U231 ( .A(n212), .B(n192), .Z(n53) );
  INVERT_F U232 ( .A(n53), .Z(n151) );
  OR2_I U233 ( .A(n151), .B(n198), .Z(n214) );
  INVERT_F U234 ( .A(n153), .Z(n152) );
  INVERT_E U235 ( .A(n190), .Z(n154) );
  INVERT_E U236 ( .A(n49), .Z(n155) );
  NOR2_C U237 ( .A(n154), .B(n155), .Z(n160) );
  INVERT_E U238 ( .A(n160), .Z(n158) );
  NOR2_C U239 ( .A(n156), .B(n157), .Z(n161) );
  INVERT_E U240 ( .A(n161), .Z(n159) );
  INVERT_L U241 ( .A(n195), .Z(n196) );
  INVERT_F U242 ( .A(n162), .Z(n163) );
  AND2_H U243 ( .A(n71), .B(n3), .Z(n42) );
  INVERT_D U244 ( .A(n42), .Z(n164) );
  INVERT_E U245 ( .A(n58), .Z(n165) );
  INVERT_F U246 ( .A(n165), .Z(n166) );
  AO22_H U247 ( .A1(n198), .A2(n212), .B1(n31), .B2(n193), .Z(n58) );
  INVERT_F U248 ( .A(n110), .Z(n167) );
  INVERT_F U249 ( .A(n168), .Z(n169) );
  NAND3_C U250 ( .A(n196), .B(n172), .C(n198), .Z(n54) );
  INVERT_E U251 ( .A(n54), .Z(n170) );
  NOR2_C U252 ( .A(n148), .B(n3), .Z(floor_one_clear) );
  NOR2_C U253 ( .A(floor_two_btn_internal), .B(floor_one_btn_internal), .Z(n49) );
  INVERT_H U254 ( .A(n12), .Z(n173) );
  NAND2BAL_E U255 ( .A(floor_three_down_btn_internal), .B(n31), .Z(n23) );
  NOR2_H U256 ( .A(n198), .B(n212), .Z(n31) );
  NOR2_C U257 ( .A(n194), .B(n16), .Z(n61) );
  INVERT_O U258 ( .A(n176), .Z(elevator_open) );
  INVERT_E U259 ( .A(n179), .Z(n216) );
  NOR2_C U260 ( .A(n183), .B(n184), .Z(n179) );
  NOR2_C U261 ( .A(n180), .B(n181), .Z(n185) );
  INVERT_E U262 ( .A(n185), .Z(n183) );
  NOR2_C U263 ( .A(n116), .B(n182), .Z(n186) );
  INVERT_E U264 ( .A(n186), .Z(n184) );
  NAND2_E U265 ( .A(n203), .B(floor_two_btn_internal), .Z(n55) );
  INVERT_F U266 ( .A(n148), .Z(n213) );
  AND2_H U267 ( .A(n4), .B(n163), .Z(n41) );
  AND4_H U268 ( .A(floor_two_down_btn_internal), .B(n142), .C(n4), .D(n11), 
        .Z(floor_two_down_clear) );
  NAND2BAL_E U269 ( .A(n37), .B(n4), .Z(n32) );
  INVERT_E U270 ( .A(n191), .Z(n192) );
  INVERT_F U271 ( .A(n191), .Z(n193) );
  INVERT_F U272 ( .A(n191), .Z(n194) );
  INVERT_H U273 ( .A(state_current[0]), .Z(n195) );
  INVERT_H U274 ( .A(n215), .Z(n201) );
  INVERT_H U275 ( .A(n214), .Z(n206) );
  NOR2_H U276 ( .A(floor_two_down_btn_internal), .B(floor_two_up_btn_internal), 
        .Z(n37) );
  INVERT_E U277 ( .A(n37), .Z(n12) );
  INVERT_F U278 ( .A(n196), .Z(n17) );
  OAI21_B U279 ( .A1(n193), .A2(n106), .B(n93), .Z(state_next[2]) );
  CLK_Q U280 ( .A(n150), .Z(n212) );
endmodule

