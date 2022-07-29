fun bar(a0) =
  let
    val z = (a0*2) + 1
  in
    (fn y => y * z)
  end;
fun foo(a0) = bar 2 a0;


print "Hello, World\n";
