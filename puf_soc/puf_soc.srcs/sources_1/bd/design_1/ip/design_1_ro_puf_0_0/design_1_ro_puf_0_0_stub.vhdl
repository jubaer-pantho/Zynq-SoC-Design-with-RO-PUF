-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Wed Apr 22 00:18:23 2020
-- Host        : DESKTOP-9CHGBR2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/workspace/2020/vivado-project/puf_soc/puf_soc.srcs/sources_1/bd/design_1/ip/design_1_ro_puf_0_0/design_1_ro_puf_0_0_stub.vhdl
-- Design      : design_1_ro_puf_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_ro_puf_0_0 is
  Port ( 
    enable : in STD_LOGIC;
    challenge : in STD_LOGIC_VECTOR ( 1 downto 0 );
    selector : in STD_LOGIC_VECTOR ( 3 downto 0 );
    leds : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end design_1_ro_puf_0_0;

architecture stub of design_1_ro_puf_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "enable,challenge[1:0],selector[3:0],leds[3:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ro_puf,Vivado 2018.2";
begin
end;
