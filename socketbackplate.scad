module round_rect(h, w) {
     union() {
          translate([-(w-h)/2, -h/2,0]) square([15,10]);
          translate([(w-h)/2,0,0]) circle(d=h, center=false);
          translate([-(w-h)/2,0,0]) circle(d=h, center=false);
     }
}

difference() {
     round_rect(10, 25);
     translate([-15/2, 0, 0]) circle(d=8);
     translate([15/2, 0, 0]) circle(d=6);
}
