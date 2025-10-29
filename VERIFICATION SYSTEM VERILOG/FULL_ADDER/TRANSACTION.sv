// Transaction Class with Constraint + InheritancE

class base_trans;
  rand bit a, b, c;
endclass

class transaction extends base_trans;
  bit sum, carry;

  // Constraint: avoid all-zero input
  constraint valid_combo {
    !(a == 0 && b == 0 && c == 0);
  }

  function void display(string name);
    $display("---- %s ----", name);
    $display("$time=%0t,a=%0b b=%0b c=%0b sum=%0b carry=%0b",$time, a, b, c, sum, carry);
  endfunction
endclass
