/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

module fir_core_core_fsm (
  clk, rst, fsm_output, Shift_Accum_Loop_C_0_tr0
);
  input clk;
  input rst;
  output [2:0] fsm_output;
  reg [2:0] fsm_output;
  input Shift_Accum_Loop_C_0_tr0;


  // FSM State Type Declaration for fir_core_core_fsm_1
  parameter
    main_C_0 = 2'd0,
    Shift_Accum_Loop_C_0 = 2'd1,
    main_C_1 = 2'd2;

  reg [1:0] state_var;
  reg [1:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations
  always @(*)
  begin : fir_core_core_fsm_1
    case (state_var)
      Shift_Accum_Loop_C_0 : begin
        fsm_output = 3'b010;
        if ( Shift_Accum_Loop_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = Shift_Accum_Loop_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 3'b100;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 3'b001;
        state_var_NS = Shift_Accum_Loop_C_0;
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= main_C_0;
    end
    else begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_core
// ------------------------------------------------------------------


module fir_core (
  clk, rst, y_rsc_dat, y_triosy_lz, x_rsc_dat, x_triosy_lz
);
  input clk;
  input rst;
  output [31:0] y_rsc_dat;
  output y_triosy_lz;
  input [31:0] x_rsc_dat;
  output x_triosy_lz;


  // Interconnect Declarations
  reg [31:0] y_rsci_idat;
  wire [31:0] x_rsci_idat;
  wire [2:0] fsm_output;
  wire [3:0] Shift_Accum_Loop_acc_tmp;
  wire [4:0] nl_Shift_Accum_Loop_acc_tmp;
  wire or_dcpl;
  wire or_dcpl_4;
  wire or_dcpl_22;
  wire or_dcpl_23;
  wire or_dcpl_26;
  reg [2:0] i_3_1_sva;
  reg reg_x_triosy_obj_ld_cse;
  wire or_tmp_18;
  wire [31:0] z_out;
  wire [32:0] nl_z_out;
  reg [31:0] shift_reg_0_lpi_2;
  reg [31:0] shift_reg_4_lpi_2;
  reg [31:0] shift_reg_6_lpi_2;
  reg [31:0] shift_reg_2_lpi_2;
  reg [31:0] shift_reg_8_lpi_2;
  reg [31:0] shift_reg_5_lpi_2;
  reg [31:0] shift_reg_3_lpi_2;
  reg [31:0] shift_reg_7_lpi_2;
  reg [31:0] shift_reg_1_lpi_2;
  reg [31:0] shift_reg_9_lpi_2;
  reg [31:0] x_sva;
  reg [1:0] acc_1_1_0_sva;
  reg [29:0] acc_1_31_2_sva;
  wire [31:0] shift_reg_8_lpi_2_mx1;
  wire [31:0] shift_reg_6_lpi_2_mx1;
  wire [31:0] shift_reg_4_lpi_2_mx1;
  wire [31:0] shift_reg_2_lpi_2_mx1;
  wire [31:0] shift_reg_0_lpi_2_mx1;
  wire [31:0] Shift_Accum_Loop_else_Shift_Accum_Loop_else_slc_shift_reg_32_31_0_1_cse_1_sva_1;
  wire [31:0] Shift_Accum_Loop_else_Shift_Accum_Loop_else_slc_shift_reg_32_31_0_1_cse_sva_1;
  wire [2:0] ROM_1i3_1o3_19557893e5a52b759ee8931059e3cb382e_1;
  wire [2:0] ROM_1i3_1o3_bbcaa648d0b22e52010350fc0b6a89632e_1;
  wire [2:0] ROM_1i3_1o3_97757079b0fc4b81ed9471ade18976e72e_1;
  wire nand_1_cse;
  wire nor_cse;
  wire [31:0] Shift_Accum_Loop_1_else_mul_itm;
  wire signed [41:0] nl_Shift_Accum_Loop_1_else_mul_itm;

  wire[29:0] Shift_Accum_Loop_else_acc_4_nl;
  wire[30:0] nl_Shift_Accum_Loop_else_acc_4_nl;
  wire[29:0] Shift_Accum_Loop_2_else_mul_nl;
  wire signed [37:0] nl_Shift_Accum_Loop_2_else_mul_nl;
  wire or_25_nl;
  wire or_27_nl;
  wire or_28_nl;
  wire or_29_nl;
  wire[2:0] Shift_Accum_Loop_else_acc_nl;
  wire[3:0] nl_Shift_Accum_Loop_else_acc_nl;
  wire[27:0] Shift_Accum_Loop_if_mux_5_nl;
  wire[27:0] Shift_Accum_Loop_if_acc_5_nl;
  wire[28:0] nl_Shift_Accum_Loop_if_acc_5_nl;
  wire[27:0] Shift_Accum_Loop_if_acc_6_nl;
  wire[28:0] nl_Shift_Accum_Loop_if_acc_6_nl;
  wire[29:0] Shift_Accum_Loop_if_mux_6_nl;
  wire[29:0] Shift_Accum_Loop_if_acc_7_nl;
  wire[30:0] nl_Shift_Accum_Loop_if_acc_7_nl;
  wire[1:0] Shift_Accum_Loop_if_mux_7_nl;

  // Interconnect Declarations for Component Instantiations
  wire [2:0] nl_U_ROM_1i3_1o3_97757079b0fc4b81ed9471ade18976e72e_rg_I_1;
  assign nl_U_ROM_1i3_1o3_97757079b0fc4b81ed9471ade18976e72e_rg_I_1 = Shift_Accum_Loop_acc_tmp[2:0];
  wire  nl_fir_core_core_fsm_inst_Shift_Accum_Loop_C_0_tr0;
  assign nl_fir_core_core_fsm_inst_Shift_Accum_Loop_C_0_tr0 = Shift_Accum_Loop_acc_tmp[3];
  ccs_out_v1 #(.rscid(32'sd1),
  .width(32'sd32)) y_rsci (
      .idat(y_rsci_idat),
      .dat(y_rsc_dat)
    );
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd32)) x_rsci (
      .dat(x_rsc_dat),
      .idat(x_rsci_idat)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) y_triosy_obj (
      .ld(reg_x_triosy_obj_ld_cse),
      .lz(y_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) x_triosy_obj (
      .ld(reg_x_triosy_obj_ld_cse),
      .lz(x_triosy_lz)
    );
  ROM_1i3_1o3_ddef5de18caef7d19d454620e8bb2e22ba  U_ROM_1i3_1o3_19557893e5a52b759ee8931059e3cb382e_rg
      (
      .I_1(i_3_1_sva),
      .O_1(ROM_1i3_1o3_19557893e5a52b759ee8931059e3cb382e_1)
    );
  ROM_1i3_1o3_6501fb06a550ab4161af017e883c5566ba  U_ROM_1i3_1o3_bbcaa648d0b22e52010350fc0b6a89632e_rg
      (
      .I_1(i_3_1_sva),
      .O_1(ROM_1i3_1o3_bbcaa648d0b22e52010350fc0b6a89632e_1)
    );
  ROM_1i3_1o3_db18e6c02b72ab8c952c312ab1172a0fba  U_ROM_1i3_1o3_97757079b0fc4b81ed9471ade18976e72e_rg
      (
      .I_1(nl_U_ROM_1i3_1o3_97757079b0fc4b81ed9471ade18976e72e_rg_I_1[2:0]),
      .O_1(ROM_1i3_1o3_97757079b0fc4b81ed9471ade18976e72e_1)
    );
  fir_core_core_fsm fir_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .Shift_Accum_Loop_C_0_tr0(nl_fir_core_core_fsm_inst_Shift_Accum_Loop_C_0_tr0)
    );
  assign nand_1_cse = ~((Shift_Accum_Loop_acc_tmp[1:0]==2'b11));
  assign nor_cse = ~((i_3_1_sva[2:1]!=2'b00));
  assign or_25_nl = (i_3_1_sva!=3'b100);
  assign shift_reg_8_lpi_2_mx1 = MUX_v_32_2_2(Shift_Accum_Loop_else_Shift_Accum_Loop_else_slc_shift_reg_32_31_0_1_cse_1_sva_1,
      shift_reg_8_lpi_2, or_25_nl);
  assign or_27_nl = or_dcpl_26 | (~ (i_3_1_sva[0]));
  assign shift_reg_6_lpi_2_mx1 = MUX_v_32_2_2(Shift_Accum_Loop_else_Shift_Accum_Loop_else_slc_shift_reg_32_31_0_1_cse_1_sva_1,
      shift_reg_6_lpi_2, or_27_nl);
  assign or_28_nl = or_dcpl_26 | (i_3_1_sva[0]);
  assign shift_reg_4_lpi_2_mx1 = MUX_v_32_2_2(Shift_Accum_Loop_else_Shift_Accum_Loop_else_slc_shift_reg_32_31_0_1_cse_1_sva_1,
      shift_reg_4_lpi_2, or_28_nl);
  assign or_29_nl = or_dcpl_22 | (~ (i_3_1_sva[0]));
  assign shift_reg_2_lpi_2_mx1 = MUX_v_32_2_2(Shift_Accum_Loop_else_Shift_Accum_Loop_else_slc_shift_reg_32_31_0_1_cse_1_sva_1,
      shift_reg_2_lpi_2, or_29_nl);
  assign shift_reg_0_lpi_2_mx1 = MUX_v_32_2_2(x_sva, shift_reg_0_lpi_2, or_dcpl_23);
  assign nl_Shift_Accum_Loop_else_acc_nl = i_3_1_sva + 3'b111;
  assign Shift_Accum_Loop_else_acc_nl = nl_Shift_Accum_Loop_else_acc_nl[2:0];
  assign Shift_Accum_Loop_else_Shift_Accum_Loop_else_slc_shift_reg_32_31_0_1_cse_1_sva_1
      = MUX_v_32_5_2(shift_reg_1_lpi_2, shift_reg_3_lpi_2, shift_reg_5_lpi_2, shift_reg_7_lpi_2,
      shift_reg_9_lpi_2, Shift_Accum_Loop_else_acc_nl);
  assign nl_Shift_Accum_Loop_acc_tmp = conv_u2u_3_4(i_3_1_sva) + 4'b1111;
  assign Shift_Accum_Loop_acc_tmp = nl_Shift_Accum_Loop_acc_tmp[3:0];
  assign Shift_Accum_Loop_else_Shift_Accum_Loop_else_slc_shift_reg_32_31_0_1_cse_sva_1
      = MUX_v_32_5_2(shift_reg_0_lpi_2_mx1, shift_reg_2_lpi_2_mx1, shift_reg_4_lpi_2_mx1,
      shift_reg_6_lpi_2_mx1, shift_reg_8_lpi_2_mx1, Shift_Accum_Loop_acc_tmp[2:0]);
  assign or_dcpl = (Shift_Accum_Loop_acc_tmp[1:0]!=2'b00);
  assign or_dcpl_4 = (Shift_Accum_Loop_acc_tmp[3:2]!=2'b00);
  assign or_dcpl_22 = (i_3_1_sva[2:1]!=2'b00);
  assign or_dcpl_23 = or_dcpl_22 | (i_3_1_sva[0]);
  assign or_dcpl_26 = (i_3_1_sva[2:1]!=2'b01);
  assign or_tmp_18 = ((i_3_1_sva!=3'b000)) & (fsm_output[1]);
  assign nl_Shift_Accum_Loop_1_else_mul_itm = $signed(Shift_Accum_Loop_else_Shift_Accum_Loop_else_slc_shift_reg_32_31_0_1_cse_1_sva_1)
      * $signed(({ROM_1i3_1o3_19557893e5a52b759ee8931059e3cb382e_1 , 2'b01 , ROM_1i3_1o3_bbcaa648d0b22e52010350fc0b6a89632e_1
      , 2'b01}));
  assign Shift_Accum_Loop_1_else_mul_itm = nl_Shift_Accum_Loop_1_else_mul_itm[31:0];
  always @(posedge clk) begin
    if ( rst ) begin
      x_sva <= 32'b00000000000000000000000000000000;
    end
    else if ( ~ (fsm_output[1]) ) begin
      x_sva <= x_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      acc_1_31_2_sva <= 30'b000000000000000000000000000000;
      acc_1_1_0_sva <= 2'b00;
      i_3_1_sva <= 3'b000;
      reg_x_triosy_obj_ld_cse <= 1'b0;
    end
    else begin
      acc_1_31_2_sva <= MUX_v_30_2_2(30'b000000000000000000000000000000, Shift_Accum_Loop_else_acc_4_nl,
          (fsm_output[1]));
      acc_1_1_0_sva <= MUX_v_2_2_2(2'b00, (z_out[1:0]), (fsm_output[1]));
      i_3_1_sva <= MUX_v_3_2_2(3'b101, (Shift_Accum_Loop_acc_tmp[2:0]), fsm_output[1]);
      reg_x_triosy_obj_ld_cse <= (Shift_Accum_Loop_acc_tmp[3]) & (fsm_output[1]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      shift_reg_1_lpi_2 <= 32'b00000000000000000000000000000000;
    end
    else if ( ~(or_dcpl_4 | or_dcpl | (~ (fsm_output[1]))) ) begin
      shift_reg_1_lpi_2 <= Shift_Accum_Loop_else_Shift_Accum_Loop_else_slc_shift_reg_32_31_0_1_cse_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      shift_reg_3_lpi_2 <= 32'b00000000000000000000000000000000;
    end
    else if ( ~(or_dcpl_4 | (Shift_Accum_Loop_acc_tmp[1:0]!=2'b01) | (~ (fsm_output[1])))
        ) begin
      shift_reg_3_lpi_2 <= Shift_Accum_Loop_else_Shift_Accum_Loop_else_slc_shift_reg_32_31_0_1_cse_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      shift_reg_5_lpi_2 <= 32'b00000000000000000000000000000000;
    end
    else if ( ~(or_dcpl_4 | (Shift_Accum_Loop_acc_tmp[1:0]!=2'b10) | (~ (fsm_output[1])))
        ) begin
      shift_reg_5_lpi_2 <= Shift_Accum_Loop_else_Shift_Accum_Loop_else_slc_shift_reg_32_31_0_1_cse_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      shift_reg_7_lpi_2 <= 32'b00000000000000000000000000000000;
    end
    else if ( ~(or_dcpl_4 | nand_1_cse | (~ (fsm_output[1]))) ) begin
      shift_reg_7_lpi_2 <= Shift_Accum_Loop_else_Shift_Accum_Loop_else_slc_shift_reg_32_31_0_1_cse_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      shift_reg_9_lpi_2 <= 32'b00000000000000000000000000000000;
    end
    else if ( ~((Shift_Accum_Loop_acc_tmp[3:2]!=2'b01) | or_dcpl | (~ (fsm_output[1])))
        ) begin
      shift_reg_9_lpi_2 <= Shift_Accum_Loop_else_Shift_Accum_Loop_else_slc_shift_reg_32_31_0_1_cse_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      y_rsci_idat <= 32'b00000000000000000000000000000000;
    end
    else if ( (or_dcpl_23 & (Shift_Accum_Loop_acc_tmp[3]) & (fsm_output[1])) | (nor_cse
        & (~ (i_3_1_sva[0])) & (Shift_Accum_Loop_acc_tmp[3]) & (fsm_output[1])) )
        begin
      y_rsci_idat <= z_out;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      shift_reg_8_lpi_2 <= 32'b00000000000000000000000000000000;
    end
    else if ( ((Shift_Accum_Loop_acc_tmp!=4'b0100)) & (i_3_1_sva==3'b100) & (fsm_output[1])
        ) begin
      shift_reg_8_lpi_2 <= shift_reg_8_lpi_2_mx1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      shift_reg_6_lpi_2 <= 32'b00000000000000000000000000000000;
    end
    else if ( (nand_1_cse | (Shift_Accum_Loop_acc_tmp[3:2]!=2'b00)) & (i_3_1_sva==3'b011)
        & (fsm_output[1]) ) begin
      shift_reg_6_lpi_2 <= shift_reg_6_lpi_2_mx1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      shift_reg_4_lpi_2 <= 32'b00000000000000000000000000000000;
    end
    else if ( ((Shift_Accum_Loop_acc_tmp!=4'b0010)) & (i_3_1_sva==3'b010) & (fsm_output[1])
        ) begin
      shift_reg_4_lpi_2 <= shift_reg_4_lpi_2_mx1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      shift_reg_2_lpi_2 <= 32'b00000000000000000000000000000000;
    end
    else if ( ((Shift_Accum_Loop_acc_tmp!=4'b0001)) & nor_cse & (i_3_1_sva[0]) &
        (fsm_output[1]) ) begin
      shift_reg_2_lpi_2 <= shift_reg_2_lpi_2_mx1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      shift_reg_0_lpi_2 <= 32'b00000000000000000000000000000000;
    end
    else if ( ((Shift_Accum_Loop_acc_tmp!=4'b0000)) & nor_cse & (~ (i_3_1_sva[0]))
        & (fsm_output[1]) ) begin
      shift_reg_0_lpi_2 <= shift_reg_0_lpi_2_mx1;
    end
  end
  assign nl_Shift_Accum_Loop_2_else_mul_nl = $signed((Shift_Accum_Loop_else_Shift_Accum_Loop_else_slc_shift_reg_32_31_0_1_cse_sva_1[29:0]))
      * $signed(conv_u2s_7_8(signext_7_3({(ROM_1i3_1o3_97757079b0fc4b81ed9471ade18976e72e_1[2])
      , 1'b0 , (ROM_1i3_1o3_97757079b0fc4b81ed9471ade18976e72e_1[0])})));
  assign Shift_Accum_Loop_2_else_mul_nl = nl_Shift_Accum_Loop_2_else_mul_nl[29:0];
  assign nl_Shift_Accum_Loop_else_acc_4_nl = (z_out[31:2]) + Shift_Accum_Loop_2_else_mul_nl;
  assign Shift_Accum_Loop_else_acc_4_nl = nl_Shift_Accum_Loop_else_acc_4_nl[29:0];
  assign nl_Shift_Accum_Loop_if_acc_6_nl = (~ (x_sva[27:0])) + ({(x_sva[25:0]) ,
      2'b01});
  assign Shift_Accum_Loop_if_acc_6_nl = nl_Shift_Accum_Loop_if_acc_6_nl[27:0];
  assign nl_Shift_Accum_Loop_if_acc_5_nl = Shift_Accum_Loop_if_acc_6_nl + (acc_1_31_2_sva[29:2]);
  assign Shift_Accum_Loop_if_acc_5_nl = nl_Shift_Accum_Loop_if_acc_5_nl[27:0];
  assign Shift_Accum_Loop_if_mux_5_nl = MUX_v_28_2_2(Shift_Accum_Loop_if_acc_5_nl,
      (acc_1_31_2_sva[29:2]), or_tmp_18);
  assign nl_Shift_Accum_Loop_if_acc_7_nl = (x_sva[31:2]) + (x_sva[29:0]);
  assign Shift_Accum_Loop_if_acc_7_nl = nl_Shift_Accum_Loop_if_acc_7_nl[29:0];
  assign Shift_Accum_Loop_if_mux_6_nl = MUX_v_30_2_2(Shift_Accum_Loop_if_acc_7_nl,
      (Shift_Accum_Loop_1_else_mul_itm[31:2]), or_tmp_18);
  assign Shift_Accum_Loop_if_mux_7_nl = MUX_v_2_2_2((x_sva[1:0]), (Shift_Accum_Loop_1_else_mul_itm[1:0]),
      or_tmp_18);
  assign nl_z_out = ({Shift_Accum_Loop_if_mux_5_nl , (acc_1_31_2_sva[1:0]) , acc_1_1_0_sva})
      + ({Shift_Accum_Loop_if_mux_6_nl , Shift_Accum_Loop_if_mux_7_nl});
  assign z_out = nl_z_out[31:0];

  function automatic [27:0] MUX_v_28_2_2;
    input [27:0] input_0;
    input [27:0] input_1;
    input  sel;
    reg [27:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_28_2_2 = result;
  end
  endfunction


  function automatic [1:0] MUX_v_2_2_2;
    input [1:0] input_0;
    input [1:0] input_1;
    input  sel;
    reg [1:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_2_2_2 = result;
  end
  endfunction


  function automatic [29:0] MUX_v_30_2_2;
    input [29:0] input_0;
    input [29:0] input_1;
    input  sel;
    reg [29:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_30_2_2 = result;
  end
  endfunction


  function automatic [31:0] MUX_v_32_2_2;
    input [31:0] input_0;
    input [31:0] input_1;
    input  sel;
    reg [31:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_32_2_2 = result;
  end
  endfunction


  function automatic [31:0] MUX_v_32_5_2;
    input [31:0] input_0;
    input [31:0] input_1;
    input [31:0] input_2;
    input [31:0] input_3;
    input [31:0] input_4;
    input [2:0] sel;
    reg [31:0] result;
  begin
    case (sel)
      3'b000 : begin
        result = input_0;
      end
      3'b001 : begin
        result = input_1;
      end
      3'b010 : begin
        result = input_2;
      end
      3'b011 : begin
        result = input_3;
      end
      default : begin
        result = input_4;
      end
    endcase
    MUX_v_32_5_2 = result;
  end
  endfunction


  function automatic [2:0] MUX_v_3_2_2;
    input [2:0] input_0;
    input [2:0] input_1;
    input  sel;
    reg [2:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_3_2_2 = result;
  end
  endfunction


  function automatic [6:0] signext_7_3;
    input [2:0] vector;
  begin
    signext_7_3= {{4{vector[2]}}, vector};
  end
  endfunction


  function automatic [7:0] conv_u2s_7_8 ;
    input [6:0]  vector ;
  begin
    conv_u2s_7_8 =  {1'b0, vector};
  end
  endfunction


  function automatic [3:0] conv_u2u_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_4 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir
// ------------------------------------------------------------------


module fir (
  clk, rst, y_rsc_dat, y_triosy_lz, x_rsc_dat, x_triosy_lz
);
  input clk;
  input rst;
  output [31:0] y_rsc_dat;
  output y_triosy_lz;
  input [31:0] x_rsc_dat;
  output x_triosy_lz;



  // Interconnect Declarations for Component Instantiations
  fir_core fir_core_inst (
      .clk(clk),
      .rst(rst),
      .y_rsc_dat(y_rsc_dat),
      .y_triosy_lz(y_triosy_lz),
      .x_rsc_dat(x_rsc_dat),
      .x_triosy_lz(x_triosy_lz)
    );
endmodule 


endmodule
