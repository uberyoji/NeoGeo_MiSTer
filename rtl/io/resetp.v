//============================================================================
//  SNK NeoGeo for MiSTer
//
//  Copyright (C) 2019 Sean 'Furrtek' Gonsalves
//
//  This program is free software; you can redistribute it and/or modify it
//  under the terms of the GNU General Public License as published by the Free
//  Software Foundation; either version 2 of the License, or (at your option)
//  any later version.
//
//  This program is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
//  more details.
//
//  You should have received a copy of the GNU General Public License along
//  with this program; if not, write to the Free Software Foundation, Inc.,
//  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//============================================================================

module resetp_sync(
	input CLK,
	input CLK_EN_24_N,
	input nRESET,
	output reg nRESETP
);

	reg O49_nQ;

	// 24MB    ""__""__""__""__""__
	// nRESET  ____________""""""""
	// nRESETP """"""""""""""____""

	always @(posedge CLK)
	begin
		if (CLK_EN_24_N) begin
			O49_nQ <= ~nRESET;
			nRESETP <= ~&{O49_nQ, nRESET};
		end
	end
	
endmodule
