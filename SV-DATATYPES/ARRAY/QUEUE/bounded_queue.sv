module bounded_queue;
int bounded_q[$:10];

initial begin
bounded_q='{256,100,150,50,25,220,67,7};
$display("bounded_queue=%p",bounded_q);

bounded_q.insert(3,4);
$display("after insert:%p",bounded_q);

bounded_q.delete(1);
$display("after delete:%p",bounded_q);

bounded_q.push_back(100);
$display("after pushback :%p",bounded_q);

bounded_q.push_front(99);
$display("after push front:%p",bounded_q);

bounded_q.shuffle();
$display("after shuffle:%p",bounded_q);

bounded_q.pop_back();
$display("after popback:%p",bounded_q);

bounded_q.pop_front();
$display("after popfront:%p",bounded_q);
bounded_q.sort();
$display("after sort:%p",bounded_q);

bounded_q.delete();
$display("after delete:%p",bounded_q);
end
endmodule

output
run
# bounded_queue='{256, 100, 150, 50, 25, 220, 67, 7}
# after insert:'{256, 100, 150, 4, 50, 25, 220, 67, 7}
# after delete:'{256, 150, 4, 50, 25, 220, 67, 7}
# after pushback :'{256, 150, 4, 50, 25, 220, 67, 7, 100}
# after push front:'{99, 256, 150, 4, 50, 25, 220, 67, 7, 100}
# after shuffle:'{100, 256, 67, 220, 4, 25, 99, 50, 7, 150}
# after popback:'{100, 256, 67, 220, 4, 25, 99, 50, 7}
# after popfront:'{256, 67, 220, 4, 25, 99, 50, 7}
# after sort:'{4, 7, 25, 50, 67, 99, 220, 256}
# after delete:'{}
