// Copyright 2024 IHP PDK Authors
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//    https://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// type: dfrbpq1arx 
`timescale 1ns/10ps
`celldefine
//*****************************************************************
//   technology       : SG13G2
//   module name      : sg13g2_dfrbpq1arx_1
//   cell_description : Posedge Single-Output Q D-Flip-Flop with Low-Active Reset
//*****************************************************************

module sg13g2_dfrbpq1arx_1 (Q, CLK, D, RESET_B);
		
	output Q;
	input CLK, D, RESET_B;
	reg notifier;
	wire delayed_D, delayed_RESET_B, delayed_CLK;

	// Function
	wire int_fwire_IQ, int_fwire_r, xcr_0;

	not (int_fwire_r, delayed_RESET_B);
	buf (xcr_0, 0);
	flsp_dff_r (int_fwire_IQ, notifier, delayed_CLK, delayed_D, int_fwire_r, xcr_0);
	buf (Q, int_fwire_IQ);

        // Timing

	specify
		(negedge RESET_B => (Q :1'b0)) = (0.0,0.0);
		(posedge CLK => (Q : D)) = (0.0,0.0);
		(negedge CLK => (Q : D)) = (0.0,0.0);
		$setuphold (posedge CLK, posedge D, 0.0, 0.0, notifier,,, delayed_CLK, delayed_D);
		$setuphold (posedge CLK, negedge D, 0.0, 0.0, notifier,,, delayed_CLK, delayed_D);
		$recrem (posedge RESET_B, posedge CLK, 0.0, 0.0, notifier,,, delayed_RESET_B, delayed_CLK);
		$width (negedge RESET_B, 0.0, 0, notifier);
		$width (posedge CLK, 0.0, 0, notifier);
		$width (negedge CLK, 0.0, 0, notifier);
	endspecify

endmodule
`endcelldefine

`ifdef _udp_def_flsp_dff_r_
`else
`define _udp_def_flsp_dff_r_
primitive flsp_dff_r (q, v, clk, d, r, xcr);
	output q;
	reg q;
	input v, clk, d, r, xcr;

	table
		*  ?   ?  ?   ? : ? : x;
		?  ?   ?  1   ? : ? : 0;
		?  b   ? (1?) ? : 0 : -;
		?  x   0 (1?) ? : 0 : -;
		?  ?   ? (10) ? : ? : -;
		?  ?   ? (x0) ? : ? : -;
		?  ?   ? (0x) ? : 0 : -;
		? (x1) 0  ?   0 : ? : 0;
		? (x1) 1  0   0 : ? : 1;
		? (x1) 0  ?   1 : 0 : 0;
		? (x1) 1  0   1 : 1 : 1;
		? (x1) ?  ?   x : ? : -;
		? (bx) 0  ?   ? : 0 : -;
		? (bx) 1  0   ? : 1 : -;
		? (x0) 0  ?   ? : ? : -;
		? (x0) 1  0   ? : ? : -;
		? (x0) ?  0   x : ? : -;
		? (01) 0  ?   ? : ? : 0;
		? (01) 1  0   ? : ? : 1;
		? (10) ?  ?   ? : ? : -;
		?  b   *  ?   ? : ? : -;
		?  ?   ?  ?   * : ? : -;
	endtable
endprimitive
`endif
