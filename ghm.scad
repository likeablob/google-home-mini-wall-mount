

difference() {
  translate([0, 0, -2])
  resize([97,0,0],auto=[true,true,true])
  rotate_extrude(convexity=10)
  translate([-20/2, 0, 0])
  difference() {
    resize([20,0,0],auto=[true,true,false])
    import("ghm.dxf");
    square(size=[20, 20], center=true);
  }

  translate([0, 0, -41.1])
  cylinder(d=98, h=41.1, center=false);
}
