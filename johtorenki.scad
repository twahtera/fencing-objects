module ring(r1, r2, h, center=false) {
     difference() {
          cylinder(h=h, r=r1, center=center);
          translate([0,0,-0.5]) cylinder(h=h+1, r=r2, center=center);
     }
}


module tapered_ring() {
     difference() {
          ring(8.1,5.5,4);
          intersection() {
               ring(8.1, 5.5, 3);
               cylinder(r1=8.1, r2=5.5, h=3);
          }
     }
}

module rounded_cylinder(h, r) {
     union() {
          cylinder(h=h-r, r=r);
          translate([0,0,h-r])
               sphere(r=r);
     }
}

// alaosa
/* difference() { */
/*      cylinder(h=20, r=8); */
/*      translate([0,0,25]) */
/*           rotate([180,0,0]) */
/*           rounded_cylinder(h=20, r=3.1); */

/*      translate([0,0,10]) tapered_ring(); */
/* } */

//kärjen osa
difference() {
     cylinder(h=25, r=8);
     translate([0,0,25])
          rotate([180,0,0])
          cylinder(h=20, r=4);
          //rounded_cylinder(h=20, r=4);

     translate([0,0,15]) tapered_ring();
}



//translate([0,0,5]) cylinder(h=45, r=3.1);


