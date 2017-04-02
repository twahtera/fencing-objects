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


module tang_tube() {
// wire notch
     translate([-2,3.5])
          cube([4,4,4]);
     
// square part 40
     translate([-3.5, -3.5])
          cube(size=[7,7,40], center=false);
     
// small cylinder part 18
     translate([0,0,40])
          cylinder(r=3.5, h=42, center=false);

// large cylinder part: rest of handle
     translate([0,0,58])
          cylinder(r=6, h=50);
}

module top_hook() {
     hull() {
          translate([0, 10, 0]) sphere(5, center=true);
          translate([0, 0, 0]) sphere(5, center=true);
          translate([0, 2, 7]) sphere(3, center=true);
     }
}



module bottom_front_hook() {
     hull() {
          translate([0, 5, 0]) sphere(5, center=true);
          translate([0, 0, 0]) sphere(5, center=true);
          translate([1, 7, 7]) sphere(3, center=true);

          translate([7, 5, 0]) sphere(5, center=true);
          translate([7, 0, 0]) sphere(5, center=true);
          translate([9, 7, 7]) sphere(3, center=true);

     }
}

module palm_grip() {
     hull() {
     /* minkowski() { */
     /*      linear_extrude(height=12) { */
     /*           polygon([[0,0], */
     /*                    [0,9], */
     /*                    [40,9], */
     /*                    [40,0], */
     /*                    [30,-20] */
     /*                        ] */
          
     /*                ); */
     /*      } */
     /*      sphere(3); */
     /* } */
          translate([-10, 7, 0])sphere(12);
          translate([30, 0, 0])sphere(16);
          #translate([27, -12, 0])sphere(12);
     
     }
}
//#palm_grip();
difference() {
     union() {
          union() {
               rounded_cylinder(17, 12, 35, 3);
               translate([-1,-8,42]) rotate([0, -96, 0]) palm_grip();
          }
*         translate([5, 7, 50]) rotate([-90, 0, 0]) top_hook();
         *translate([3,-7,37]) rotate([90,180,0]) bottom_front_hook();

     }
     tang_tube();
}
