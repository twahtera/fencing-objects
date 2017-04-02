module rounded_cylinder(x, y, h, r) {
     linear_extrude(height=h) {
          translate([-(x-r)/2, -(y-r)/2]) {
               minkowski() {
                    square([x-r,y-r]);
                    circle(r);
               }
          }
     }
}


difference() {
     rounded_cylinder(17, 12, 85, 2);
// wire notch
     translate([-2,3])
          cube([4,4,4]);
     
// square part 40
     translate([-3.5, -3.5])
          cube(size=[7,7,40], center=false);
     
// small cylinder part 18
     translate([0,0,40])
          cylinder(r=3.5, h=42, center=false);

// large cylinder part: rest of handle
     translate([0,0,58])
          cylinder(r=6, h=30);
}
