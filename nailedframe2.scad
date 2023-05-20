thick=0.05;
$fn=40;
R=sqrt(2)/2;
gap=0.01;

module hooks(){
    for(i=[-33:9:39])
        difference(){
            intersection(){
                hull(){
                    rotate([0,0,i])
                        translate([R,0,0])
                            scale([thick*2, thick/2, thick*2])
                                sphere(1);
                    translate([0.5,0,0.5])
                        sphere(thick/2);
                }
               cylinder(r=1, h=1);
            }
            rotate([0,0,i])
                translate([R+thick/2,0,0])
                    rotate([90,0,0])
                        cylinder(r=thick/2, center=true);
            }
}

//hooks();

module hook2(){
    difference(){
        intersection(){
            translate([R,0,-thick/4])
                scale([thick*2, thick/2, thick*2])
                    sphere(1);
            cylinder(r=1, h=1);
        }
        translate([R,0,0])
            rotate([90,0,0])
                cylinder(r=thick, center=true);
    }
}

module hooks2(){
    for(i=[-32:8.5:40])
        rotate([0,0,i])
            hook2();
}


module dovetail_m(){
    translate([0.5, 0.3/2-gap, 0])
    rotate([0,0,90])
    cylinder(r=0.3-gap*2, h=thick, $fn=3);
}

module dovetail_f(){
    translate([1, 0.5, 0.3/2])
    rotate([0,-90,0])
    cylinder(r=0.3, h=thick+gap, $fn=3);
}


module panelA(){
    translate([-1,0,0]){
        difference(){
            union(){
                dovetail_m();
                translate([0,thick+gap,0])
                    cube([1,1-thick-gap,thick]);
            }
            translate([-0.5, 0.5, 0]){
                cylinder(h=thick, r=R);
            }
            dovetail_f();
            // square hole
            translate([0.35-thick/2, 0.15+thick/2, 0])
                cube([0.5, 0.7, 1]);
        }
        intersection(){
            translate([-0.50, 0.5, 0])
                hooks2();
            cube([1.2,1,thick*2]);
        }
    }
}


module panelB(){
    translate([0,0,1])
    rotate([0,180,0]){
    intersection(){
        cube([1,1,1]);
        translate([-0.5, 0.5, 0]){
            cylinder(h=thick, r=R);
//            translate([0,0,thick])
//                cylinder(h=1-thick, r1=R, r2=0);
            hooks2();
        }
    }
}
}


module pins(){
    for(i=[-33:9:39])
        rotate([0,0,i])
            translate([R,0,0])
                scale([thick*2,
                       thick/2,
                       thick])
                    sphere(1);
}


module panels(){
    panelA();
rotate([0,90,90])
    panelB();
}

scale(60){
panels();
}
/*
rotate([0,90,90])
panels();
rotate([0,90,90])
rotate([0,90,90])
panels();
}
*/
