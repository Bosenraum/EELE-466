library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity eight_bit_rca is
  port (A, B : in std_logic_vector(7 downto 0);
        Sub  : in std_logic;
        S    : out std_logic_vector(7 downto 0);
        Cout : out std_logic);
end entity;

architecture eight_bit_rca_arch of eight_bit_rca is

  component full_adder is
    port (A, B  : in std_logic;
          Cin   : in std_logic;
          Cout  : out std_logic;
          S     : out std_logic);
  end component;

  signal C0, C1, C2, C3, C4, C5, C6, C7 : std_logic;
  signal Bin : std_logic_vector(7 downto 0);

  begin

  Cout <= C7;

  Bin(0) <= B(0) xor Sub;
  Bin(1) <= B(1) xor Sub;
  Bin(2) <= B(2) xor Sub;
  Bin(3) <= B(3) xor Sub;
  Bin(4) <= B(4) xor Sub;
  Bin(5) <= B(5) xor Sub;
  Bin(6) <= B(6) xor Sub;
  Bin(7) <= B(7) xor Sub;

  A0 : full_adder port map(A => A(0), B => Bin(0), Cin => Sub, Cout => C0, S => S(0));
  A1 : full_adder port map(A => A(1), B => Bin(1), Cin => C0, Cout => C1, S => S(1));
  A2 : full_adder port map(A => A(2), B => Bin(2), Cin => C1, Cout => C2, S => S(2));
  A3 : full_adder port map(A => A(3), B => Bin(3), Cin => C2, Cout => C3, S => S(3));
  A4 : full_adder port map(A => A(4), B => Bin(4), Cin => C3, Cout => C4, S => S(4));
  A5 : full_adder port map(A => A(5), B => Bin(5), Cin => C4, Cout => C5, S => S(5));
  A6 : full_adder port map(A => A(6), B => Bin(6), Cin => C5, Cout => C6, S => S(6));
  A7 : full_adder port map(A => A(7), B => Bin(7), Cin => C6, Cout => C7, S => S(7));

end architecture; 
