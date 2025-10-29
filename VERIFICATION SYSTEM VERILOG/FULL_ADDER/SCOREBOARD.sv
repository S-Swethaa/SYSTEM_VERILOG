//SCOREBOARD CLASS
class scoreboard;
  mailbox m2s;

  function new(mailbox m2s);
    this.m2s = m2s;
  endfunction

  task main();
      transaction trans;
       bit ref_sum;
       bit ref_carry;
     repeat (5) begin
      m2s.get(trans);
       trans.display("Scoreboard class signals");
      ref_sum = trans.a ^ trans.b ^ trans.c;
      ref_carry = (trans.a & trans.b) | (trans.b & trans.c) | (trans.c & trans.a);
      if (ref_sum == trans.sum && ref_carry == trans.carry)
        $display("***PASS***,ref_sum=%0b,ref_carry=%0b,trans.sum=%0b,trans.carry=%0b",ref_sum,ref_carry,trans.sum,trans.carry);
      else
        $display("**********************FAIL************************,ref_sum=%0b,ref_carry=%0b,trans.sum=%0b,trans.carry=%0b",ref_sum,ref_carry,trans.sum,trans.carry);
    end
  endtask
endclass
