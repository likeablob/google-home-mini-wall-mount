include <copy_mirror.scad>

$fn=80;

// FIXME: eliminate magic numbers!

module ghm() {
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
}

module staplerHoles() {
  copy_mirror([1,0,0])
  translate([9/2, 0, 0])
  cylinder(d=1.5, h=10, center=true);
}

// body
difference() {
  // base body
  intersection() {
    translate([0, 0, 0])
    union() {
      difference() {
        translate([0, 0, -1.2])
        resize([98+2.5,0,0],auto=[true,true,true])
        ghm();

        // inner vacant
        resize([98-0.5,0,0],auto=[true,true,true])
        ghm();
      }
      // add thickness to bottom
      translate([0, 0, -1.5])
      cylinder(d=69, h=1.5, center=true);
    }

    // body width
    translate([0, 0, 38/2 -3])
    cube(size=[100, 25, 38], center=true);
  }

  // staper holes
  copy_mirror([1,0,0])
  copy_mirror([0,1,0])
  translate([22, 10/2, 0])
  staplerHoles();

  copy_mirror([0,1,0])
  translate([0, 10/2, 0])
  staplerHoles();

  // hole for usb
  translate([98/2, 0, 8.5])
  rotate([0, 90, 0])
  hull() {
    copy_mirror([0,1,0])
    translate([0, (11-6.7)/2, 0])
    cylinder(d=6.7, h=30, center=true);
  }
}
