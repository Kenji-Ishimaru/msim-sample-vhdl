-- =======================================================================
--                          Sample Project
-- 
--  File:
--    mod_top.vhd
-- 
--  Abstract:
--    module top
-- 
--   Created:
--     2  February 2016
-- ======================================================================
-- 
--  Copyright (c) 2016, Kenji Ishimaru
--  All rights reserved.
-- 
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions are met:
-- 
--   -Redistributions of source code must retain the above copyright notice,
--    this list of conditions and the following disclaimer.
--   -Redistributions in binary form must reproduce the above copyright notice,
--    this list of conditions and the following disclaimer in the documentation
--    and/or other materials provided with the distribution.
-- 
--  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
--  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
--  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
--  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
--  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
--  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
--  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
--  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
--  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
--  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-- 

library IEEE;
use IEEE.std_logic_1164.all;

entity mod_top is
  port (
    clk : in std_logic;
    rst_x: in std_logic;
    i_in : in std_logic_vector(7 downto 0);
    o_out : out std_logic_vector(7 downto 0)
  );
end mod_top;

architecture rtl of mod_top is

component mod_a is
  port (
    clk : in std_logic;
    rst_x: in std_logic;
    i_in : in std_logic_vector(7 downto 0);
    o_out : out std_logic_vector(7 downto 0)
  );
end component;

component mod_b is
  port (
    clk : in std_logic;
    rst_x: in std_logic;
    i_in : in std_logic_vector(7 downto 0);
    o_out : out std_logic_vector(7 downto 0)
  );
end component;

signal w_out_a : std_logic_vector(7 downto 0);
begin
  u_mod_a : mod_a port map (
    clk => clk, 
    rst_x => rst_x,
    i_in => i_in,
    o_out => w_out_a
  );

  u_mod_b : mod_b port map (
    clk => clk,
    rst_x => rst_x,
    i_in => w_out_a,
    o_out => o_out
  );

end rtl;
