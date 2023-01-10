// core_modular_adc_0.v

// This file was auto-generated from altera_modular_adc_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 18.0 614

`timescale 1 ps / 1 ps
module core_modular_adc_0 #(
		parameter is_this_first_or_second_adc = 1
	) (
		input  wire        clock_clk,                  //            clock.clk
		input  wire        reset_sink_reset_n,         //       reset_sink.reset_n
		input  wire        adc_pll_clock_clk,          //    adc_pll_clock.clk
		input  wire        adc_pll_locked_export,      //   adc_pll_locked.export
		input  wire        sequencer_csr_address,      //    sequencer_csr.address
		input  wire        sequencer_csr_read,         //                 .read
		input  wire        sequencer_csr_write,        //                 .write
		input  wire [31:0] sequencer_csr_writedata,    //                 .writedata
		output wire [31:0] sequencer_csr_readdata,     //                 .readdata
		input  wire [6:0]  sample_store_csr_address,   // sample_store_csr.address
		input  wire        sample_store_csr_read,      //                 .read
		input  wire        sample_store_csr_write,     //                 .write
		input  wire [31:0] sample_store_csr_writedata, //                 .writedata
		output wire [31:0] sample_store_csr_readdata,  //                 .readdata
		output wire        sample_store_irq_irq        // sample_store_irq.irq
	);

	wire         sequencer_internal_command_valid;          // sequencer_internal:cmd_valid -> control_internal:cmd_valid
	wire         sequencer_internal_command_ready;          // control_internal:cmd_ready -> sequencer_internal:cmd_ready
	wire   [4:0] sequencer_internal_command_channel;        // sequencer_internal:cmd_channel -> control_internal:cmd_channel
	wire         sequencer_internal_command_startofpacket;  // sequencer_internal:cmd_sop -> control_internal:cmd_sop
	wire         sequencer_internal_command_endofpacket;    // sequencer_internal:cmd_eop -> control_internal:cmd_eop
	wire         control_internal_response_valid;           // control_internal:rsp_valid -> avalon_st_adapter:in_0_valid
	wire  [11:0] control_internal_response_data;            // control_internal:rsp_data -> avalon_st_adapter:in_0_data
	wire   [4:0] control_internal_response_channel;         // control_internal:rsp_channel -> avalon_st_adapter:in_0_channel
	wire         control_internal_response_startofpacket;   // control_internal:rsp_sop -> avalon_st_adapter:in_0_startofpacket
	wire         control_internal_response_endofpacket;     // control_internal:rsp_eop -> avalon_st_adapter:in_0_endofpacket
	wire         avalon_st_adapter_out_0_valid;             // avalon_st_adapter:out_0_valid -> st_splitter_internal:in0_valid
	wire  [11:0] avalon_st_adapter_out_0_data;              // avalon_st_adapter:out_0_data -> st_splitter_internal:in0_data
	wire   [4:0] avalon_st_adapter_out_0_channel;           // avalon_st_adapter:out_0_channel -> st_splitter_internal:in0_channel
	wire         avalon_st_adapter_out_0_startofpacket;     // avalon_st_adapter:out_0_startofpacket -> st_splitter_internal:in0_startofpacket
	wire         avalon_st_adapter_out_0_endofpacket;       // avalon_st_adapter:out_0_endofpacket -> st_splitter_internal:in0_endofpacket
	wire         avalon_st_adapter_out_0_empty;             // avalon_st_adapter:out_0_empty -> st_splitter_internal:in0_empty
	wire         st_splitter_internal_out0_valid;           // st_splitter_internal:out0_valid -> avalon_st_adapter_001:in_0_valid
	wire  [11:0] st_splitter_internal_out0_data;            // st_splitter_internal:out0_data -> avalon_st_adapter_001:in_0_data
	wire   [4:0] st_splitter_internal_out0_channel;         // st_splitter_internal:out0_channel -> avalon_st_adapter_001:in_0_channel
	wire         st_splitter_internal_out0_startofpacket;   // st_splitter_internal:out0_startofpacket -> avalon_st_adapter_001:in_0_startofpacket
	wire         st_splitter_internal_out0_endofpacket;     // st_splitter_internal:out0_endofpacket -> avalon_st_adapter_001:in_0_endofpacket
	wire   [0:0] st_splitter_internal_out0_empty;           // st_splitter_internal:out0_empty -> avalon_st_adapter_001:in_0_empty
	wire         avalon_st_adapter_001_out_0_valid;         // avalon_st_adapter_001:out_0_valid -> sample_store_internal:rsp_valid
	wire  [11:0] avalon_st_adapter_001_out_0_data;          // avalon_st_adapter_001:out_0_data -> sample_store_internal:rsp_data
	wire   [4:0] avalon_st_adapter_001_out_0_channel;       // avalon_st_adapter_001:out_0_channel -> sample_store_internal:rsp_channel
	wire         avalon_st_adapter_001_out_0_startofpacket; // avalon_st_adapter_001:out_0_startofpacket -> sample_store_internal:rsp_sop
	wire         avalon_st_adapter_001_out_0_endofpacket;   // avalon_st_adapter_001:out_0_endofpacket -> sample_store_internal:rsp_eop
	wire         st_splitter_internal_out1_valid;           // st_splitter_internal:out1_valid -> avalon_st_adapter_002:in_0_valid
	wire  [11:0] st_splitter_internal_out1_data;            // st_splitter_internal:out1_data -> avalon_st_adapter_002:in_0_data
	wire   [4:0] st_splitter_internal_out1_channel;         // st_splitter_internal:out1_channel -> avalon_st_adapter_002:in_0_channel
	wire         st_splitter_internal_out1_startofpacket;   // st_splitter_internal:out1_startofpacket -> avalon_st_adapter_002:in_0_startofpacket
	wire         st_splitter_internal_out1_endofpacket;     // st_splitter_internal:out1_endofpacket -> avalon_st_adapter_002:in_0_endofpacket
	wire   [0:0] st_splitter_internal_out1_empty;           // st_splitter_internal:out1_empty -> avalon_st_adapter_002:in_0_empty
	wire         avalon_st_adapter_002_out_0_valid;         // avalon_st_adapter_002:out_0_valid -> adc_monitor_internal:adc_data_valid
	wire  [11:0] avalon_st_adapter_002_out_0_data;          // avalon_st_adapter_002:out_0_data -> adc_monitor_internal:adc_data_data
	wire   [4:0] avalon_st_adapter_002_out_0_channel;       // avalon_st_adapter_002:out_0_channel -> adc_monitor_internal:adc_data_channel
	wire         avalon_st_adapter_002_out_0_startofpacket; // avalon_st_adapter_002:out_0_startofpacket -> adc_monitor_internal:adc_data_startofpacket
	wire         avalon_st_adapter_002_out_0_endofpacket;   // avalon_st_adapter_002:out_0_endofpacket -> adc_monitor_internal:adc_data_endofpacket

	generate
		// If any of the display statements (or deliberately broken
		// instantiations) within this generate block triggers then this module
		// has been instantiated this module with a set of parameters different
		// from those it was generated for.  This will usually result in a
		// non-functioning system.
		if (is_this_first_or_second_adc != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					is_this_first_or_second_adc_check ( .error(1'b1) );
		end
	endgenerate

	altera_modular_adc_control #(
		.clkdiv                          (2),
		.tsclkdiv                        (1),
		.tsclksel                        (1),
		.hard_pwd                        (0),
		.prescalar                       (0),
		.refsel                          (0),
		.device_partname_fivechar_prefix ("10M50"),
		.is_this_first_or_second_adc     (1),
		.analog_input_pin_mask           (1),
		.dual_adc_mode                   (0),
		.enable_usr_sim                  (0),
		.reference_voltage_sim           (49648),
		.simfilename_ch0                 (""),
		.simfilename_ch1                 (""),
		.simfilename_ch2                 (""),
		.simfilename_ch3                 (""),
		.simfilename_ch4                 (""),
		.simfilename_ch5                 (""),
		.simfilename_ch6                 (""),
		.simfilename_ch7                 (""),
		.simfilename_ch8                 (""),
		.simfilename_ch9                 (""),
		.simfilename_ch10                (""),
		.simfilename_ch11                (""),
		.simfilename_ch12                (""),
		.simfilename_ch13                (""),
		.simfilename_ch14                (""),
		.simfilename_ch15                (""),
		.simfilename_ch16                ("")
	) control_internal (
		.clk               (clock_clk),                                //         clock.clk
		.cmd_valid         (sequencer_internal_command_valid),         //       command.valid
		.cmd_channel       (sequencer_internal_command_channel),       //              .channel
		.cmd_sop           (sequencer_internal_command_startofpacket), //              .startofpacket
		.cmd_eop           (sequencer_internal_command_endofpacket),   //              .endofpacket
		.cmd_ready         (sequencer_internal_command_ready),         //              .ready
		.rst_n             (reset_sink_reset_n),                       //    reset_sink.reset_n
		.rsp_valid         (control_internal_response_valid),          //      response.valid
		.rsp_channel       (control_internal_response_channel),        //              .channel
		.rsp_data          (control_internal_response_data),           //              .data
		.rsp_sop           (control_internal_response_startofpacket),  //              .startofpacket
		.rsp_eop           (control_internal_response_endofpacket),    //              .endofpacket
		.clk_in_pll_c0     (adc_pll_clock_clk),                        // adc_pll_clock.clk
		.clk_in_pll_locked (adc_pll_locked_export),                    //   conduit_end.export
		.sync_valid        (),                                         //   (terminated)
		.sync_ready        (1'b0)                                      //   (terminated)
	);

	core_modular_adc_0_adc_monitor_internal #(
		.ADC_DATA_WIDTH        (12),
		.ADC_CHANNEL_WIDTH     (5),
		.CAPTURE_DATA_WIDTH    (8),
		.CONTROL_DATA_WIDTH    (32),
		.CONTROL_ADDRESS_WIDTH (5),
		.COUNT_WIDTH           (12)
	) adc_monitor_internal (
		.clk_clk                (clock_clk),                                 //      clk.clk
		.reset_reset            (~reset_sink_reset_n),                       //    reset.reset
		.adc_data_channel       (avalon_st_adapter_002_out_0_channel),       // adc_data.channel
		.adc_data_data          (avalon_st_adapter_002_out_0_data),          //         .data
		.adc_data_endofpacket   (avalon_st_adapter_002_out_0_endofpacket),   //         .endofpacket
		.adc_data_startofpacket (avalon_st_adapter_002_out_0_startofpacket), //         .startofpacket
		.adc_data_valid         (avalon_st_adapter_002_out_0_valid)          //         .valid
	);

	altera_modular_adc_sequencer #(
		.DUAL_ADC_MODE    (0),
		.CSD_LENGTH       (1),
		.CSD_SLOT_0       (5'b00001),
		.CSD_SLOT_1       (5'b00000),
		.CSD_SLOT_2       (5'b00000),
		.CSD_SLOT_3       (5'b00000),
		.CSD_SLOT_4       (5'b00000),
		.CSD_SLOT_5       (5'b00000),
		.CSD_SLOT_6       (5'b00000),
		.CSD_SLOT_7       (5'b00000),
		.CSD_SLOT_8       (5'b00000),
		.CSD_SLOT_9       (5'b00000),
		.CSD_SLOT_10      (5'b00000),
		.CSD_SLOT_11      (5'b00000),
		.CSD_SLOT_12      (5'b00000),
		.CSD_SLOT_13      (5'b00000),
		.CSD_SLOT_14      (5'b00000),
		.CSD_SLOT_15      (5'b00000),
		.CSD_SLOT_16      (5'b00000),
		.CSD_SLOT_17      (5'b00000),
		.CSD_SLOT_18      (5'b00000),
		.CSD_SLOT_19      (5'b00000),
		.CSD_SLOT_20      (5'b00000),
		.CSD_SLOT_21      (5'b00000),
		.CSD_SLOT_22      (5'b00000),
		.CSD_SLOT_23      (5'b00000),
		.CSD_SLOT_24      (5'b00000),
		.CSD_SLOT_25      (5'b00000),
		.CSD_SLOT_26      (5'b00000),
		.CSD_SLOT_27      (5'b00000),
		.CSD_SLOT_28      (5'b00000),
		.CSD_SLOT_29      (5'b00000),
		.CSD_SLOT_30      (5'b00000),
		.CSD_SLOT_31      (5'b00000),
		.CSD_SLOT_32      (5'b00000),
		.CSD_SLOT_33      (5'b00000),
		.CSD_SLOT_34      (5'b00000),
		.CSD_SLOT_35      (5'b00000),
		.CSD_SLOT_36      (5'b00000),
		.CSD_SLOT_37      (5'b00000),
		.CSD_SLOT_38      (5'b00000),
		.CSD_SLOT_39      (5'b00000),
		.CSD_SLOT_40      (5'b00000),
		.CSD_SLOT_41      (5'b00000),
		.CSD_SLOT_42      (5'b00000),
		.CSD_SLOT_43      (5'b00000),
		.CSD_SLOT_44      (5'b00000),
		.CSD_SLOT_45      (5'b00000),
		.CSD_SLOT_46      (5'b00000),
		.CSD_SLOT_47      (5'b00000),
		.CSD_SLOT_48      (5'b00000),
		.CSD_SLOT_49      (5'b00000),
		.CSD_SLOT_50      (5'b00000),
		.CSD_SLOT_51      (5'b00000),
		.CSD_SLOT_52      (5'b00000),
		.CSD_SLOT_53      (5'b00000),
		.CSD_SLOT_54      (5'b00000),
		.CSD_SLOT_55      (5'b00000),
		.CSD_SLOT_56      (5'b00000),
		.CSD_SLOT_57      (5'b00000),
		.CSD_SLOT_58      (5'b00000),
		.CSD_SLOT_59      (5'b00000),
		.CSD_SLOT_60      (5'b00000),
		.CSD_SLOT_61      (5'b00000),
		.CSD_SLOT_62      (5'b00000),
		.CSD_SLOT_63      (5'b00000),
		.CSD_SLOT_0_ADC2  (5'b00000),
		.CSD_SLOT_1_ADC2  (5'b00000),
		.CSD_SLOT_2_ADC2  (5'b00000),
		.CSD_SLOT_3_ADC2  (5'b00000),
		.CSD_SLOT_4_ADC2  (5'b00000),
		.CSD_SLOT_5_ADC2  (5'b00000),
		.CSD_SLOT_6_ADC2  (5'b00000),
		.CSD_SLOT_7_ADC2  (5'b00000),
		.CSD_SLOT_8_ADC2  (5'b00000),
		.CSD_SLOT_9_ADC2  (5'b00000),
		.CSD_SLOT_10_ADC2 (5'b00000),
		.CSD_SLOT_11_ADC2 (5'b00000),
		.CSD_SLOT_12_ADC2 (5'b00000),
		.CSD_SLOT_13_ADC2 (5'b00000),
		.CSD_SLOT_14_ADC2 (5'b00000),
		.CSD_SLOT_15_ADC2 (5'b00000),
		.CSD_SLOT_16_ADC2 (5'b00000),
		.CSD_SLOT_17_ADC2 (5'b00000),
		.CSD_SLOT_18_ADC2 (5'b00000),
		.CSD_SLOT_19_ADC2 (5'b00000),
		.CSD_SLOT_20_ADC2 (5'b00000),
		.CSD_SLOT_21_ADC2 (5'b00000),
		.CSD_SLOT_22_ADC2 (5'b00000),
		.CSD_SLOT_23_ADC2 (5'b00000),
		.CSD_SLOT_24_ADC2 (5'b00000),
		.CSD_SLOT_25_ADC2 (5'b00000),
		.CSD_SLOT_26_ADC2 (5'b00000),
		.CSD_SLOT_27_ADC2 (5'b00000),
		.CSD_SLOT_28_ADC2 (5'b00000),
		.CSD_SLOT_29_ADC2 (5'b00000),
		.CSD_SLOT_30_ADC2 (5'b00000),
		.CSD_SLOT_31_ADC2 (5'b00000),
		.CSD_SLOT_32_ADC2 (5'b00000),
		.CSD_SLOT_33_ADC2 (5'b00000),
		.CSD_SLOT_34_ADC2 (5'b00000),
		.CSD_SLOT_35_ADC2 (5'b00000),
		.CSD_SLOT_36_ADC2 (5'b00000),
		.CSD_SLOT_37_ADC2 (5'b00000),
		.CSD_SLOT_38_ADC2 (5'b00000),
		.CSD_SLOT_39_ADC2 (5'b00000),
		.CSD_SLOT_40_ADC2 (5'b00000),
		.CSD_SLOT_41_ADC2 (5'b00000),
		.CSD_SLOT_42_ADC2 (5'b00000),
		.CSD_SLOT_43_ADC2 (5'b00000),
		.CSD_SLOT_44_ADC2 (5'b00000),
		.CSD_SLOT_45_ADC2 (5'b00000),
		.CSD_SLOT_46_ADC2 (5'b00000),
		.CSD_SLOT_47_ADC2 (5'b00000),
		.CSD_SLOT_48_ADC2 (5'b00000),
		.CSD_SLOT_49_ADC2 (5'b00000),
		.CSD_SLOT_50_ADC2 (5'b00000),
		.CSD_SLOT_51_ADC2 (5'b00000),
		.CSD_SLOT_52_ADC2 (5'b00000),
		.CSD_SLOT_53_ADC2 (5'b00000),
		.CSD_SLOT_54_ADC2 (5'b00000),
		.CSD_SLOT_55_ADC2 (5'b00000),
		.CSD_SLOT_56_ADC2 (5'b00000),
		.CSD_SLOT_57_ADC2 (5'b00000),
		.CSD_SLOT_58_ADC2 (5'b00000),
		.CSD_SLOT_59_ADC2 (5'b00000),
		.CSD_SLOT_60_ADC2 (5'b00000),
		.CSD_SLOT_61_ADC2 (5'b00000),
		.CSD_SLOT_62_ADC2 (5'b00000),
		.CSD_SLOT_63_ADC2 (5'b00000)
	) sequencer_internal (
		.clk           (clock_clk),                                //      clock.clk
		.rst_n         (reset_sink_reset_n),                       // reset_sink.reset_n
		.cmd_ready     (sequencer_internal_command_ready),         //    command.ready
		.cmd_valid     (sequencer_internal_command_valid),         //           .valid
		.cmd_channel   (sequencer_internal_command_channel),       //           .channel
		.cmd_sop       (sequencer_internal_command_startofpacket), //           .startofpacket
		.cmd_eop       (sequencer_internal_command_endofpacket),   //           .endofpacket
		.addr          (sequencer_csr_address),                    //        csr.address
		.read          (sequencer_csr_read),                       //           .read
		.write         (sequencer_csr_write),                      //           .write
		.writedata     (sequencer_csr_writedata),                  //           .writedata
		.readdata      (sequencer_csr_readdata),                   //           .readdata
		.cmd_ready_2   (1'b0),                                     // (terminated)
		.cmd_valid_2   (),                                         // (terminated)
		.cmd_channel_2 (),                                         // (terminated)
		.cmd_sop_2     (),                                         // (terminated)
		.cmd_eop_2     ()                                          // (terminated)
	);

	altera_modular_adc_sample_store #(
		.DUAL_ADC_MODE  (0),
		.RSP_DATA_WIDTH (12)
	) sample_store_internal (
		.clk         (clock_clk),                                 //            clock.clk
		.rst_n       (reset_sink_reset_n),                        //       reset_sink.reset_n
		.rsp_valid   (avalon_st_adapter_001_out_0_valid),         //         response.valid
		.rsp_channel (avalon_st_adapter_001_out_0_channel),       //                 .channel
		.rsp_sop     (avalon_st_adapter_001_out_0_startofpacket), //                 .startofpacket
		.rsp_eop     (avalon_st_adapter_001_out_0_endofpacket),   //                 .endofpacket
		.rsp_data    (avalon_st_adapter_001_out_0_data),          //                 .data
		.addr        (sample_store_csr_address),                  //              csr.address
		.read        (sample_store_csr_read),                     //                 .read
		.write       (sample_store_csr_write),                    //                 .write
		.writedata   (sample_store_csr_writedata),                //                 .writedata
		.readdata    (sample_store_csr_readdata),                 //                 .readdata
		.irq         (sample_store_irq_irq)                       // interrupt_sender.irq
	);

	altera_avalon_st_splitter #(
		.NUMBER_OF_OUTPUTS (2),
		.QUALIFY_VALID_OUT (0),
		.USE_PACKETS       (1),
		.DATA_WIDTH        (12),
		.CHANNEL_WIDTH     (5),
		.ERROR_WIDTH       (1),
		.BITS_PER_SYMBOL   (12),
		.EMPTY_WIDTH       (1)
	) st_splitter_internal (
		.clk                 (clock_clk),                               //   clk.clk
		.reset               (~reset_sink_reset_n),                     // reset.reset
		.in0_valid           (avalon_st_adapter_out_0_valid),           //    in.valid
		.in0_startofpacket   (avalon_st_adapter_out_0_startofpacket),   //      .startofpacket
		.in0_endofpacket     (avalon_st_adapter_out_0_endofpacket),     //      .endofpacket
		.in0_empty           (avalon_st_adapter_out_0_empty),           //      .empty
		.in0_channel         (avalon_st_adapter_out_0_channel),         //      .channel
		.in0_data            (avalon_st_adapter_out_0_data),            //      .data
		.out0_valid          (st_splitter_internal_out0_valid),         //  out0.valid
		.out0_startofpacket  (st_splitter_internal_out0_startofpacket), //      .startofpacket
		.out0_endofpacket    (st_splitter_internal_out0_endofpacket),   //      .endofpacket
		.out0_empty          (st_splitter_internal_out0_empty),         //      .empty
		.out0_channel        (st_splitter_internal_out0_channel),       //      .channel
		.out0_data           (st_splitter_internal_out0_data),          //      .data
		.out1_valid          (st_splitter_internal_out1_valid),         //  out1.valid
		.out1_startofpacket  (st_splitter_internal_out1_startofpacket), //      .startofpacket
		.out1_endofpacket    (st_splitter_internal_out1_endofpacket),   //      .endofpacket
		.out1_empty          (st_splitter_internal_out1_empty),         //      .empty
		.out1_channel        (st_splitter_internal_out1_channel),       //      .channel
		.out1_data           (st_splitter_internal_out1_data),          //      .data
		.in0_ready           (),                                        // (terminated)
		.in0_error           (1'b0),                                    // (terminated)
		.out0_ready          (1'b1),                                    // (terminated)
		.out0_error          (),                                        // (terminated)
		.out1_ready          (1'b1),                                    // (terminated)
		.out1_error          (),                                        // (terminated)
		.out2_ready          (1'b1),                                    // (terminated)
		.out2_valid          (),                                        // (terminated)
		.out2_startofpacket  (),                                        // (terminated)
		.out2_endofpacket    (),                                        // (terminated)
		.out2_empty          (),                                        // (terminated)
		.out2_channel        (),                                        // (terminated)
		.out2_error          (),                                        // (terminated)
		.out2_data           (),                                        // (terminated)
		.out3_ready          (1'b1),                                    // (terminated)
		.out3_valid          (),                                        // (terminated)
		.out3_startofpacket  (),                                        // (terminated)
		.out3_endofpacket    (),                                        // (terminated)
		.out3_empty          (),                                        // (terminated)
		.out3_channel        (),                                        // (terminated)
		.out3_error          (),                                        // (terminated)
		.out3_data           (),                                        // (terminated)
		.out4_ready          (1'b1),                                    // (terminated)
		.out4_valid          (),                                        // (terminated)
		.out4_startofpacket  (),                                        // (terminated)
		.out4_endofpacket    (),                                        // (terminated)
		.out4_empty          (),                                        // (terminated)
		.out4_channel        (),                                        // (terminated)
		.out4_error          (),                                        // (terminated)
		.out4_data           (),                                        // (terminated)
		.out5_ready          (1'b1),                                    // (terminated)
		.out5_valid          (),                                        // (terminated)
		.out5_startofpacket  (),                                        // (terminated)
		.out5_endofpacket    (),                                        // (terminated)
		.out5_empty          (),                                        // (terminated)
		.out5_channel        (),                                        // (terminated)
		.out5_error          (),                                        // (terminated)
		.out5_data           (),                                        // (terminated)
		.out6_ready          (1'b1),                                    // (terminated)
		.out6_valid          (),                                        // (terminated)
		.out6_startofpacket  (),                                        // (terminated)
		.out6_endofpacket    (),                                        // (terminated)
		.out6_empty          (),                                        // (terminated)
		.out6_channel        (),                                        // (terminated)
		.out6_error          (),                                        // (terminated)
		.out6_data           (),                                        // (terminated)
		.out7_ready          (1'b1),                                    // (terminated)
		.out7_valid          (),                                        // (terminated)
		.out7_startofpacket  (),                                        // (terminated)
		.out7_endofpacket    (),                                        // (terminated)
		.out7_empty          (),                                        // (terminated)
		.out7_channel        (),                                        // (terminated)
		.out7_error          (),                                        // (terminated)
		.out7_data           (),                                        // (terminated)
		.out8_ready          (1'b1),                                    // (terminated)
		.out8_valid          (),                                        // (terminated)
		.out8_startofpacket  (),                                        // (terminated)
		.out8_endofpacket    (),                                        // (terminated)
		.out8_empty          (),                                        // (terminated)
		.out8_channel        (),                                        // (terminated)
		.out8_error          (),                                        // (terminated)
		.out8_data           (),                                        // (terminated)
		.out9_ready          (1'b1),                                    // (terminated)
		.out9_valid          (),                                        // (terminated)
		.out9_startofpacket  (),                                        // (terminated)
		.out9_endofpacket    (),                                        // (terminated)
		.out9_empty          (),                                        // (terminated)
		.out9_channel        (),                                        // (terminated)
		.out9_error          (),                                        // (terminated)
		.out9_data           (),                                        // (terminated)
		.out10_ready         (1'b1),                                    // (terminated)
		.out10_valid         (),                                        // (terminated)
		.out10_startofpacket (),                                        // (terminated)
		.out10_endofpacket   (),                                        // (terminated)
		.out10_empty         (),                                        // (terminated)
		.out10_channel       (),                                        // (terminated)
		.out10_error         (),                                        // (terminated)
		.out10_data          (),                                        // (terminated)
		.out11_ready         (1'b1),                                    // (terminated)
		.out11_valid         (),                                        // (terminated)
		.out11_startofpacket (),                                        // (terminated)
		.out11_endofpacket   (),                                        // (terminated)
		.out11_empty         (),                                        // (terminated)
		.out11_channel       (),                                        // (terminated)
		.out11_error         (),                                        // (terminated)
		.out11_data          (),                                        // (terminated)
		.out12_ready         (1'b1),                                    // (terminated)
		.out12_valid         (),                                        // (terminated)
		.out12_startofpacket (),                                        // (terminated)
		.out12_endofpacket   (),                                        // (terminated)
		.out12_empty         (),                                        // (terminated)
		.out12_channel       (),                                        // (terminated)
		.out12_error         (),                                        // (terminated)
		.out12_data          (),                                        // (terminated)
		.out13_ready         (1'b1),                                    // (terminated)
		.out13_valid         (),                                        // (terminated)
		.out13_startofpacket (),                                        // (terminated)
		.out13_endofpacket   (),                                        // (terminated)
		.out13_empty         (),                                        // (terminated)
		.out13_channel       (),                                        // (terminated)
		.out13_error         (),                                        // (terminated)
		.out13_data          (),                                        // (terminated)
		.out14_ready         (1'b1),                                    // (terminated)
		.out14_valid         (),                                        // (terminated)
		.out14_startofpacket (),                                        // (terminated)
		.out14_endofpacket   (),                                        // (terminated)
		.out14_empty         (),                                        // (terminated)
		.out14_channel       (),                                        // (terminated)
		.out14_error         (),                                        // (terminated)
		.out14_data          (),                                        // (terminated)
		.out15_ready         (1'b1),                                    // (terminated)
		.out15_valid         (),                                        // (terminated)
		.out15_startofpacket (),                                        // (terminated)
		.out15_endofpacket   (),                                        // (terminated)
		.out15_empty         (),                                        // (terminated)
		.out15_channel       (),                                        // (terminated)
		.out15_error         (),                                        // (terminated)
		.out15_data          ()                                         // (terminated)
	);

	core_modular_adc_0_avalon_st_adapter #(
		.inBitsPerSymbol (12),
		.inUsePackets    (1),
		.inDataWidth     (12),
		.inChannelWidth  (5),
		.inErrorWidth    (0),
		.inUseEmptyPort  (0),
		.inUseValid      (1),
		.inUseReady      (0),
		.inReadyLatency  (0),
		.outDataWidth    (12),
		.outChannelWidth (5),
		.outErrorWidth   (0),
		.outUseEmptyPort (1),
		.outUseValid     (1),
		.outUseReady     (0),
		.outReadyLatency (0)
	) avalon_st_adapter (
		.in_clk_0_clk        (clock_clk),                               // in_clk_0.clk
		.in_rst_0_reset      (~reset_sink_reset_n),                     // in_rst_0.reset
		.in_0_data           (control_internal_response_data),          //     in_0.data
		.in_0_valid          (control_internal_response_valid),         //         .valid
		.in_0_startofpacket  (control_internal_response_startofpacket), //         .startofpacket
		.in_0_endofpacket    (control_internal_response_endofpacket),   //         .endofpacket
		.in_0_channel        (control_internal_response_channel),       //         .channel
		.out_0_data          (avalon_st_adapter_out_0_data),            //    out_0.data
		.out_0_valid         (avalon_st_adapter_out_0_valid),           //         .valid
		.out_0_startofpacket (avalon_st_adapter_out_0_startofpacket),   //         .startofpacket
		.out_0_endofpacket   (avalon_st_adapter_out_0_endofpacket),     //         .endofpacket
		.out_0_empty         (avalon_st_adapter_out_0_empty),           //         .empty
		.out_0_channel       (avalon_st_adapter_out_0_channel)          //         .channel
	);

	core_modular_adc_0_avalon_st_adapter_001 #(
		.inBitsPerSymbol (12),
		.inUsePackets    (1),
		.inDataWidth     (12),
		.inChannelWidth  (5),
		.inErrorWidth    (0),
		.inUseEmptyPort  (1),
		.inUseValid      (1),
		.inUseReady      (0),
		.inReadyLatency  (0),
		.outDataWidth    (12),
		.outChannelWidth (5),
		.outErrorWidth   (0),
		.outUseEmptyPort (0),
		.outUseValid     (1),
		.outUseReady     (0),
		.outReadyLatency (0)
	) avalon_st_adapter_001 (
		.in_clk_0_clk        (clock_clk),                                 // in_clk_0.clk
		.in_rst_0_reset      (~reset_sink_reset_n),                       // in_rst_0.reset
		.in_0_data           (st_splitter_internal_out0_data),            //     in_0.data
		.in_0_valid          (st_splitter_internal_out0_valid),           //         .valid
		.in_0_startofpacket  (st_splitter_internal_out0_startofpacket),   //         .startofpacket
		.in_0_endofpacket    (st_splitter_internal_out0_endofpacket),     //         .endofpacket
		.in_0_empty          (st_splitter_internal_out0_empty),           //         .empty
		.in_0_channel        (st_splitter_internal_out0_channel),         //         .channel
		.out_0_data          (avalon_st_adapter_001_out_0_data),          //    out_0.data
		.out_0_valid         (avalon_st_adapter_001_out_0_valid),         //         .valid
		.out_0_startofpacket (avalon_st_adapter_001_out_0_startofpacket), //         .startofpacket
		.out_0_endofpacket   (avalon_st_adapter_001_out_0_endofpacket),   //         .endofpacket
		.out_0_channel       (avalon_st_adapter_001_out_0_channel)        //         .channel
	);

	core_modular_adc_0_avalon_st_adapter_001 #(
		.inBitsPerSymbol (12),
		.inUsePackets    (1),
		.inDataWidth     (12),
		.inChannelWidth  (5),
		.inErrorWidth    (0),
		.inUseEmptyPort  (1),
		.inUseValid      (1),
		.inUseReady      (0),
		.inReadyLatency  (0),
		.outDataWidth    (12),
		.outChannelWidth (5),
		.outErrorWidth   (0),
		.outUseEmptyPort (0),
		.outUseValid     (1),
		.outUseReady     (0),
		.outReadyLatency (0)
	) avalon_st_adapter_002 (
		.in_clk_0_clk        (clock_clk),                                 // in_clk_0.clk
		.in_rst_0_reset      (~reset_sink_reset_n),                       // in_rst_0.reset
		.in_0_data           (st_splitter_internal_out1_data),            //     in_0.data
		.in_0_valid          (st_splitter_internal_out1_valid),           //         .valid
		.in_0_startofpacket  (st_splitter_internal_out1_startofpacket),   //         .startofpacket
		.in_0_endofpacket    (st_splitter_internal_out1_endofpacket),     //         .endofpacket
		.in_0_empty          (st_splitter_internal_out1_empty),           //         .empty
		.in_0_channel        (st_splitter_internal_out1_channel),         //         .channel
		.out_0_data          (avalon_st_adapter_002_out_0_data),          //    out_0.data
		.out_0_valid         (avalon_st_adapter_002_out_0_valid),         //         .valid
		.out_0_startofpacket (avalon_st_adapter_002_out_0_startofpacket), //         .startofpacket
		.out_0_endofpacket   (avalon_st_adapter_002_out_0_endofpacket),   //         .endofpacket
		.out_0_channel       (avalon_st_adapter_002_out_0_channel)        //         .channel
	);

endmodule