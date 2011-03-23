param n := 4;

param mu {1..30};
param A {j in 1..30} := 2*sin(mu[j])/(mu[j] + sin(mu[j])*cos(mu[j]));

var x {1..n};
var rho {j in 1..30}
    =
    -
    (
	    exp(-mu[j]^2 * sum{i in 1..n} x[i]^2)
	    +
	    sum {ii in 2..n} 
		 2 * (-1)^(ii-1) * exp(-mu[j]^2 * sum{i in ii..n} x[i]^2)
	    +
	    (-1)^n
    )/mu[j]^2
    ;

minimize obj: 
  sum {i in 1..n} x[i]^2
  ;

subject to constr1: 
	sum {i in 1..30}
	sum {j in i+1..30} 
	    mu[i]^2 * mu[j]^2 * A[i] * A[j] * rho[i] * rho[j] *
	    (sin(mu[i]+mu[j])/(mu[i]+mu[j]) + sin(mu[i]-mu[j])/(mu[i]-mu[j]))
	+
	sum {j in 1..30}
	    mu[j]^4 * A[j]^2 * rho[j]^2 *
	    (sin(2*mu[j])/(2*mu[j]) + 1)/2
	-
	sum {j in 1..30}
	    mu[j]^2 * A[j] * rho[j] * 
	    (
		2*sin(mu[j])/mu[j]^3 - 2*cos(mu[j])/mu[j]^2
	    )
	+
	2/15
    <= 0.0001;

data;

param mu :=
 1   8.6033358901938017e-01
 2   3.4256184594817283e+00
 3   6.4372981791719468e+00
 4   9.5293344053619631e+00
 5   1.2645287223856643e+01
 6   1.5771284874815882e+01
 7   1.8902409956860023e+01
 8   2.2036496727938566e+01
 9   2.5172446326646664e+01
10   2.8309642854452012e+01
11   3.1447714637546234e+01
12   3.4586424215288922e+01
13   3.7725612827776501e+01
14   4.0865170330488070e+01
15   4.4005017920830845e+01
16   4.7145097736761031e+01
17   5.0285366337773652e+01
18   5.3425790477394663e+01
19   5.6566344279821521e+01
20   5.9707007305335459e+01
21   6.2847763194454451e+01
22   6.5988598698490392e+01
23   6.9129502973895256e+01
24   7.2270467060308960e+01
25   7.5411483488848148e+01
26   7.8552545984242926e+01
27   8.1693649235601683e+01
28   8.4834788718042290e+01
29   8.7975960552493220e+01
30   9.1117161394464745e+01
  ;

let {i in 1..n} x[i] := 0.5 * (-1)^(i+1);

#printf "optimal solution as starting point \n";
#let x[1] := 1.074319;
#let x[1] := -0.4566137;

display obj; 

solve;

display x;

display obj;

display obj - 1.36265681;

