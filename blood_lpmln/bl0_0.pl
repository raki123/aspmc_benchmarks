{algebraic_atom(18,0,0,set(p),bloodtype(p,a),"0.90")}.
{algebraic_atom(18,1,0,set(p),bloodtype(p,b),"0.03")}.
{algebraic_atom(18,2,0,set(p),bloodtype(p,ab),"0.03")}.
{algebraic_atom(18,3,0,set(p),bloodtype(p,null),"0.04")}.
{algebraic_atom(19,0,0,set(p),bloodtype(p,a),"0.03")}.
{algebraic_atom(19,1,0,set(p),bloodtype(p,b),"0.03")}.
{algebraic_atom(19,2,0,set(p),bloodtype(p,ab),"0.90")}.
{algebraic_atom(19,3,0,set(p),bloodtype(p,null),"0.04")}.
{algebraic_atom(20,0,0,set(p),bloodtype(p,a),"0.90")}.
{algebraic_atom(20,1,0,set(p),bloodtype(p,b),"0.04")}.
{algebraic_atom(20,2,0,set(p),bloodtype(p,ab),"0.03")}.
{algebraic_atom(20,3,0,set(p),bloodtype(p,null),"0.03")}.
{algebraic_atom(21,0,0,set(p),bloodtype(p,a),"0.03")}.
{algebraic_atom(21,1,0,set(p),bloodtype(p,b),"0.03")}.
{algebraic_atom(21,2,0,set(p),bloodtype(p,ab),"0.90")}.
{algebraic_atom(21,3,0,set(p),bloodtype(p,null),"0.04")}.
{algebraic_atom(22,0,0,set(p),bloodtype(p,a),"0.04")}.
{algebraic_atom(22,1,0,set(p),bloodtype(p,b),"0.90")}.
{algebraic_atom(22,2,0,set(p),bloodtype(p,ab),"0.03")}.
{algebraic_atom(22,3,0,set(p),bloodtype(p,null),"0.03")}.
{algebraic_atom(23,0,0,set(p),bloodtype(p,a),"0.03")}.
{algebraic_atom(23,1,0,set(p),bloodtype(p,b),"0.90")}.
{algebraic_atom(23,2,0,set(p),bloodtype(p,ab),"0.04")}.
{algebraic_atom(23,3,0,set(p),bloodtype(p,null),"0.03")}.
{algebraic_atom(24,0,0,set(p),bloodtype(p,a),"0.90")}.
{algebraic_atom(24,1,0,set(p),bloodtype(p,b),"0.03")}.
{algebraic_atom(24,2,0,set(p),bloodtype(p,ab),"0.03")}.
{algebraic_atom(24,3,0,set(p),bloodtype(p,null),"0.04")}.
{algebraic_atom(25,0,0,set(p),bloodtype(p,a),"0.03")}.
{algebraic_atom(25,1,0,set(p),bloodtype(p,b),"0.90")}.
{algebraic_atom(25,2,0,set(p),bloodtype(p,ab),"0.04")}.
{algebraic_atom(25,3,0,set(p),bloodtype(p,null),"0.03")}.
{algebraic_atom(26,0,0,set(p),bloodtype(p,a),"0.03")}.
{algebraic_atom(26,1,0,set(p),bloodtype(p,b),"0.04")}.
{algebraic_atom(26,2,0,set(p),bloodtype(p,ab),"0.03")}.
{algebraic_atom(26,3,0,set(p),bloodtype(p,null),"0.90")}.
{algebraic_atom(27,0,0,set(none),mchrom(p,a),"0.3")}.
{algebraic_atom(27,1,0,set(none),mchrom(p,b),"0.3")}.
{algebraic_atom(27,2,0,set(none),mchrom(p,null),"0.4")}.
{algebraic_atom(28,0,0,set(none),pchrom(p,a),"0.3")}.
{algebraic_atom(28,1,0,set(none),pchrom(p,b),"0.3")}.
{algebraic_atom(28,2,0,set(none),pchrom(p,null),"0.4")}.
algebraic_atom(19,2,1,set(p),bloodtype(p,ab),"0.90"):-algebraic_atom(19,1,1,set(p),bloodtype(p,b),"0.03").
algebraic_atom(23,3,1,set(p),bloodtype(p,null),"0.03"):-algebraic_atom(23,3,0,set(p),bloodtype(p,null),"0.03").
algebraic_atom(21,3,1,set(p),bloodtype(p,null),"0.04"):-algebraic_atom(21,2,1,set(p),bloodtype(p,ab),"0.90").
algebraic_atom(22,2,1,set(p),bloodtype(p,ab),"0.03"):-algebraic_atom(22,2,0,set(p),bloodtype(p,ab),"0.03").
algebraic_atom(23,1,1,set(p),bloodtype(p,b),"0.90"):-algebraic_atom(23,1,0,set(p),bloodtype(p,b),"0.90").
bloodtype(p,a):-algebraic_atom(23,0,0,set(p),bloodtype(p,a),"0.03"),mchrom(p,b),pchrom(p,null).
algebraic_atom(20,3,1,set(p),bloodtype(p,null),"0.03"):-algebraic_atom(20,2,1,set(p),bloodtype(p,ab),"0.03").
bloodtype(p,ab):-algebraic_atom(18,2,0,set(p),bloodtype(p,ab),"0.03"),mchrom(p,a),pchrom(p,a),not algebraic_atom(18,1,1,set(p),bloodtype(p,b),"0.03").
bloodtype(p,a):-algebraic_atom(26,0,0,set(p),bloodtype(p,a),"0.03"),mchrom(p,null),pchrom(p,null).
algebraic_atom(22,1,1,set(p),bloodtype(p,b),"0.90"):-algebraic_atom(22,1,0,set(p),bloodtype(p,b),"0.90").
algebraic_atom(21,2,1,set(p),bloodtype(p,ab),"0.90"):-algebraic_atom(21,1,1,set(p),bloodtype(p,b),"0.03").
mchrom(p,b):-algebraic_atom(27,1,0,set(none),mchrom(p,b),"0.3"),not algebraic_atom(27,0,0,set(none),mchrom(p,a),"0.3").
mchrom(p,null):-algebraic_atom(27,2,0,set(none),mchrom(p,null),"0.4"),not algebraic_atom(27,1,1,set(none),mchrom(p,b),"0.3").
algebraic_atom(18,3,1,set(p),bloodtype(p,null),"0.04"):-algebraic_atom(18,2,1,set(p),bloodtype(p,ab),"0.03").
algebraic_atom(20,2,1,set(p),bloodtype(p,ab),"0.03"):-algebraic_atom(20,2,0,set(p),bloodtype(p,ab),"0.03").
algebraic_atom(20,3,1,set(p),bloodtype(p,null),"0.03"):-algebraic_atom(20,3,0,set(p),bloodtype(p,null),"0.03").
algebraic_atom(24,1,1,set(p),bloodtype(p,b),"0.03"):-algebraic_atom(24,1,0,set(p),bloodtype(p,b),"0.03").
algebraic_atom(23,2,1,set(p),bloodtype(p,ab),"0.04"):-algebraic_atom(23,2,0,set(p),bloodtype(p,ab),"0.04").
bloodtype(p,ab):-algebraic_atom(21,2,0,set(p),bloodtype(p,ab),"0.90"),mchrom(p,b),pchrom(p,a),not algebraic_atom(21,1,1,set(p),bloodtype(p,b),"0.03").
bloodtype(p,ab):-algebraic_atom(19,2,0,set(p),bloodtype(p,ab),"0.90"),mchrom(p,a),pchrom(p,b),not algebraic_atom(19,1,1,set(p),bloodtype(p,b),"0.03").
algebraic_atom(27,1,1,set(none),mchrom(p,b),"0.3"):-algebraic_atom(27,0,0,set(none),mchrom(p,a),"0.3").
algebraic_atom(19,1,1,set(p),bloodtype(p,b),"0.03"):-algebraic_atom(19,0,0,set(p),bloodtype(p,a),"0.03").
algebraic_atom(20,1,1,set(p),bloodtype(p,b),"0.04"):-algebraic_atom(20,1,0,set(p),bloodtype(p,b),"0.04").
algebraic_atom(23,2,1,set(p),bloodtype(p,ab),"0.04"):-algebraic_atom(23,1,1,set(p),bloodtype(p,b),"0.90").
algebraic_atom(26,1,1,set(p),bloodtype(p,b),"0.04"):-algebraic_atom(26,1,0,set(p),bloodtype(p,b),"0.04").
bloodtype(p,null):-algebraic_atom(19,3,0,set(p),bloodtype(p,null),"0.04"),mchrom(p,a),pchrom(p,b),not algebraic_atom(19,2,1,set(p),bloodtype(p,ab),"0.90").
algebraic_atom(21,1,1,set(p),bloodtype(p,b),"0.03"):-algebraic_atom(21,0,0,set(p),bloodtype(p,a),"0.03").
bloodtype(p,a):-algebraic_atom(21,0,0,set(p),bloodtype(p,a),"0.03"),mchrom(p,b),pchrom(p,a).
bloodtype(p,b):-algebraic_atom(26,1,0,set(p),bloodtype(p,b),"0.04"),mchrom(p,null),pchrom(p,null),not algebraic_atom(26,0,0,set(p),bloodtype(p,a),"0.03").
bloodtype(p,ab):-algebraic_atom(26,2,0,set(p),bloodtype(p,ab),"0.03"),mchrom(p,null),pchrom(p,null),not algebraic_atom(26,1,1,set(p),bloodtype(p,b),"0.04").
algebraic_atom(28,2,1,set(none),pchrom(p,null),"0.4"):-algebraic_atom(28,1,1,set(none),pchrom(p,b),"0.3").
bloodtype(p,a):-algebraic_atom(24,0,0,set(p),bloodtype(p,a),"0.90"),mchrom(p,null),pchrom(p,a).
bloodtype(p,null):-algebraic_atom(24,3,0,set(p),bloodtype(p,null),"0.04"),mchrom(p,null),pchrom(p,a),not algebraic_atom(24,2,1,set(p),bloodtype(p,ab),"0.03").
pchrom(p,a):-algebraic_atom(28,0,0,set(none),pchrom(p,a),"0.3").
bloodtype(p,b):-algebraic_atom(21,1,0,set(p),bloodtype(p,b),"0.03"),mchrom(p,b),pchrom(p,a),not algebraic_atom(21,0,0,set(p),bloodtype(p,a),"0.03").
bloodtype(p,b):-algebraic_atom(24,1,0,set(p),bloodtype(p,b),"0.03"),mchrom(p,null),pchrom(p,a),not algebraic_atom(24,0,0,set(p),bloodtype(p,a),"0.90").
algebraic_atom(18,2,1,set(p),bloodtype(p,ab),"0.03"):-algebraic_atom(18,1,1,set(p),bloodtype(p,b),"0.03").
algebraic_atom(19,3,1,set(p),bloodtype(p,null),"0.04"):-algebraic_atom(19,2,1,set(p),bloodtype(p,ab),"0.90").
bloodtype(p,ab):-algebraic_atom(22,2,0,set(p),bloodtype(p,ab),"0.03"),mchrom(p,b),pchrom(p,b),not algebraic_atom(22,1,1,set(p),bloodtype(p,b),"0.90").
algebraic_atom(25,1,1,set(p),bloodtype(p,b),"0.90"):-algebraic_atom(25,0,0,set(p),bloodtype(p,a),"0.03").
bloodtype(p,null):-algebraic_atom(20,3,0,set(p),bloodtype(p,null),"0.03"),mchrom(p,a),pchrom(p,null),not algebraic_atom(20,2,1,set(p),bloodtype(p,ab),"0.03").
algebraic_atom(28,2,1,set(none),pchrom(p,null),"0.4"):-algebraic_atom(28,2,0,set(none),pchrom(p,null),"0.4").
algebraic_atom(27,2,1,set(none),mchrom(p,null),"0.4"):-algebraic_atom(27,1,1,set(none),mchrom(p,b),"0.3").
pchrom(p,b):-algebraic_atom(28,1,0,set(none),pchrom(p,b),"0.3"),not algebraic_atom(28,0,0,set(none),pchrom(p,a),"0.3").
bloodtype(p,null):-algebraic_atom(26,3,0,set(p),bloodtype(p,null),"0.90"),mchrom(p,null),pchrom(p,null),not algebraic_atom(26,2,1,set(p),bloodtype(p,ab),"0.03").
algebraic_atom(19,2,1,set(p),bloodtype(p,ab),"0.90"):-algebraic_atom(19,2,0,set(p),bloodtype(p,ab),"0.90").
algebraic_atom(25,1,1,set(p),bloodtype(p,b),"0.90"):-algebraic_atom(25,1,0,set(p),bloodtype(p,b),"0.90").
algebraic_atom(18,1,1,set(p),bloodtype(p,b),"0.03"):-algebraic_atom(18,0,0,set(p),bloodtype(p,a),"0.90").
bloodtype(p,ab):-algebraic_atom(20,2,0,set(p),bloodtype(p,ab),"0.03"),mchrom(p,a),pchrom(p,null),not algebraic_atom(20,1,1,set(p),bloodtype(p,b),"0.04").
algebraic_atom(28,1,1,set(none),pchrom(p,b),"0.3"):-algebraic_atom(28,0,0,set(none),pchrom(p,a),"0.3").
bloodtype(p,null):-algebraic_atom(18,3,0,set(p),bloodtype(p,null),"0.04"),mchrom(p,a),pchrom(p,a),not algebraic_atom(18,2,1,set(p),bloodtype(p,ab),"0.03").
bloodtype(p,a):-algebraic_atom(25,0,0,set(p),bloodtype(p,a),"0.03"),mchrom(p,null),pchrom(p,b).
algebraic_atom(26,2,1,set(p),bloodtype(p,ab),"0.03"):-algebraic_atom(26,2,0,set(p),bloodtype(p,ab),"0.03").
bloodtype(p,b):-algebraic_atom(20,1,0,set(p),bloodtype(p,b),"0.04"),mchrom(p,a),pchrom(p,null),not algebraic_atom(20,0,0,set(p),bloodtype(p,a),"0.90").
algebraic_atom(18,3,1,set(p),bloodtype(p,null),"0.04"):-algebraic_atom(18,3,0,set(p),bloodtype(p,null),"0.04").
algebraic_atom(27,1,1,set(none),mchrom(p,b),"0.3"):-algebraic_atom(27,1,0,set(none),mchrom(p,b),"0.3").
algebraic_atom(27,2,1,set(none),mchrom(p,null),"0.4"):-algebraic_atom(27,2,0,set(none),mchrom(p,null),"0.4").
bloodtype(p,a):-algebraic_atom(19,0,0,set(p),bloodtype(p,a),"0.03"),mchrom(p,a),pchrom(p,b).
bloodtype(p,null):-algebraic_atom(23,3,0,set(p),bloodtype(p,null),"0.03"),mchrom(p,b),pchrom(p,null),not algebraic_atom(23,2,1,set(p),bloodtype(p,ab),"0.04").
bloodtype(p,null):-algebraic_atom(25,3,0,set(p),bloodtype(p,null),"0.03"),mchrom(p,null),pchrom(p,b),not algebraic_atom(25,2,1,set(p),bloodtype(p,ab),"0.04").
algebraic_atom(24,3,1,set(p),bloodtype(p,null),"0.04"):-algebraic_atom(24,2,1,set(p),bloodtype(p,ab),"0.03").
bloodtype(p,b):-algebraic_atom(18,1,0,set(p),bloodtype(p,b),"0.03"),mchrom(p,a),pchrom(p,a),not algebraic_atom(18,0,0,set(p),bloodtype(p,a),"0.90").
bloodtype(p,b):-algebraic_atom(25,1,0,set(p),bloodtype(p,b),"0.90"),mchrom(p,null),pchrom(p,b),not algebraic_atom(25,0,0,set(p),bloodtype(p,a),"0.03").
bloodtype(p,a):-algebraic_atom(20,0,0,set(p),bloodtype(p,a),"0.90"),mchrom(p,a),pchrom(p,null).
algebraic_atom(21,3,1,set(p),bloodtype(p,null),"0.04"):-algebraic_atom(21,3,0,set(p),bloodtype(p,null),"0.04").
algebraic_atom(23,1,1,set(p),bloodtype(p,b),"0.90"):-algebraic_atom(23,0,0,set(p),bloodtype(p,a),"0.03").
bloodtype(p,ab):-algebraic_atom(23,2,0,set(p),bloodtype(p,ab),"0.04"),mchrom(p,b),pchrom(p,null),not algebraic_atom(23,1,1,set(p),bloodtype(p,b),"0.90").
algebraic_atom(19,3,1,set(p),bloodtype(p,null),"0.04"):-algebraic_atom(19,3,0,set(p),bloodtype(p,null),"0.04").
algebraic_atom(22,1,1,set(p),bloodtype(p,b),"0.90"):-algebraic_atom(22,0,0,set(p),bloodtype(p,a),"0.04").
algebraic_atom(26,3,1,set(p),bloodtype(p,null),"0.90"):-algebraic_atom(26,3,0,set(p),bloodtype(p,null),"0.90").
algebraic_atom(22,3,1,set(p),bloodtype(p,null),"0.03"):-algebraic_atom(22,3,0,set(p),bloodtype(p,null),"0.03").
algebraic_atom(18,1,1,set(p),bloodtype(p,b),"0.03"):-algebraic_atom(18,1,0,set(p),bloodtype(p,b),"0.03").
algebraic_atom(21,2,1,set(p),bloodtype(p,ab),"0.90"):-algebraic_atom(21,2,0,set(p),bloodtype(p,ab),"0.90").
bloodtype(p,null):-algebraic_atom(21,3,0,set(p),bloodtype(p,null),"0.04"),mchrom(p,b),pchrom(p,a),not algebraic_atom(21,2,1,set(p),bloodtype(p,ab),"0.90").
algebraic_atom(19,1,1,set(p),bloodtype(p,b),"0.03"):-algebraic_atom(19,1,0,set(p),bloodtype(p,b),"0.03").
bloodtype(p,b):-algebraic_atom(23,1,0,set(p),bloodtype(p,b),"0.90"),mchrom(p,b),pchrom(p,null),not algebraic_atom(23,0,0,set(p),bloodtype(p,a),"0.03").
algebraic_atom(25,2,1,set(p),bloodtype(p,ab),"0.04"):-algebraic_atom(25,1,1,set(p),bloodtype(p,b),"0.90").
algebraic_atom(22,3,1,set(p),bloodtype(p,null),"0.03"):-algebraic_atom(22,2,1,set(p),bloodtype(p,ab),"0.03").
algebraic_atom(24,2,1,set(p),bloodtype(p,ab),"0.03"):-algebraic_atom(24,1,1,set(p),bloodtype(p,b),"0.03").
bloodtype(p,ab):-algebraic_atom(24,2,0,set(p),bloodtype(p,ab),"0.03"),mchrom(p,null),pchrom(p,a),not algebraic_atom(24,1,1,set(p),bloodtype(p,b),"0.03").
bloodtype(p,ab):-algebraic_atom(25,2,0,set(p),bloodtype(p,ab),"0.04"),mchrom(p,null),pchrom(p,b),not algebraic_atom(25,1,1,set(p),bloodtype(p,b),"0.90").
algebraic_atom(26,3,1,set(p),bloodtype(p,null),"0.90"):-algebraic_atom(26,2,1,set(p),bloodtype(p,ab),"0.03").
algebraic_atom(25,3,1,set(p),bloodtype(p,null),"0.03"):-algebraic_atom(25,3,0,set(p),bloodtype(p,null),"0.03").
bloodtype(p,null):-algebraic_atom(22,3,0,set(p),bloodtype(p,null),"0.03"),mchrom(p,b),pchrom(p,b),not algebraic_atom(22,2,1,set(p),bloodtype(p,ab),"0.03").
algebraic_atom(20,1,1,set(p),bloodtype(p,b),"0.04"):-algebraic_atom(20,0,0,set(p),bloodtype(p,a),"0.90").
algebraic_atom(28,1,1,set(none),pchrom(p,b),"0.3"):-algebraic_atom(28,1,0,set(none),pchrom(p,b),"0.3").
algebraic_atom(21,1,1,set(p),bloodtype(p,b),"0.03"):-algebraic_atom(21,1,0,set(p),bloodtype(p,b),"0.03").
algebraic_atom(26,1,1,set(p),bloodtype(p,b),"0.04"):-algebraic_atom(26,0,0,set(p),bloodtype(p,a),"0.03").
bloodtype(p,b):-algebraic_atom(22,1,0,set(p),bloodtype(p,b),"0.90"),mchrom(p,b),pchrom(p,b),not algebraic_atom(22,0,0,set(p),bloodtype(p,a),"0.04").
bloodtype(p,a):-algebraic_atom(18,0,0,set(p),bloodtype(p,a),"0.90"),mchrom(p,a),pchrom(p,a).
algebraic_atom(25,3,1,set(p),bloodtype(p,null),"0.03"):-algebraic_atom(25,2,1,set(p),bloodtype(p,ab),"0.04").
pchrom(p,null):-algebraic_atom(28,2,0,set(none),pchrom(p,null),"0.4"),not algebraic_atom(28,1,1,set(none),pchrom(p,b),"0.3").
algebraic_atom(24,3,1,set(p),bloodtype(p,null),"0.04"):-algebraic_atom(24,3,0,set(p),bloodtype(p,null),"0.04").
bloodtype(p,a):-algebraic_atom(22,0,0,set(p),bloodtype(p,a),"0.04"),mchrom(p,b),pchrom(p,b).
algebraic_atom(25,2,1,set(p),bloodtype(p,ab),"0.04"):-algebraic_atom(25,2,0,set(p),bloodtype(p,ab),"0.04").
algebraic_atom(23,3,1,set(p),bloodtype(p,null),"0.03"):-algebraic_atom(23,2,1,set(p),bloodtype(p,ab),"0.04").
algebraic_atom(26,2,1,set(p),bloodtype(p,ab),"0.03"):-algebraic_atom(26,1,1,set(p),bloodtype(p,b),"0.04").
algebraic_atom(20,2,1,set(p),bloodtype(p,ab),"0.03"):-algebraic_atom(20,1,1,set(p),bloodtype(p,b),"0.04").
algebraic_atom(22,2,1,set(p),bloodtype(p,ab),"0.03"):-algebraic_atom(22,1,1,set(p),bloodtype(p,b),"0.90").
algebraic_atom(24,2,1,set(p),bloodtype(p,ab),"0.03"):-algebraic_atom(24,2,0,set(p),bloodtype(p,ab),"0.03").
bloodtype(p,b):-algebraic_atom(19,1,0,set(p),bloodtype(p,b),"0.03"),mchrom(p,a),pchrom(p,b),not algebraic_atom(19,0,0,set(p),bloodtype(p,a),"0.03").
algebraic_atom(24,1,1,set(p),bloodtype(p,b),"0.03"):-algebraic_atom(24,0,0,set(p),bloodtype(p,a),"0.90").
algebraic_atom(18,2,1,set(p),bloodtype(p,ab),"0.03"):-algebraic_atom(18,2,0,set(p),bloodtype(p,ab),"0.03").
mchrom(p,a):-algebraic_atom(27,0,0,set(none),mchrom(p,a),"0.3").
query(bloodtype(p,a)) :- bloodtype(p,a).
-0.10536051565782628:- not algebraic_atom(18,0,0,set(p),bloodtype(p,a),"0.90").
-2.302585092994046:- algebraic_atom(18,0,0,set(p),bloodtype(p,a),"0.90").
-1.203972804325936:- not algebraic_atom(18,1,0,set(p),bloodtype(p,b),"0.03").
-0.35667494393873245:- algebraic_atom(18,1,0,set(p),bloodtype(p,b),"0.03").
-0.8472978603872034:- not algebraic_atom(18,2,0,set(p),bloodtype(p,ab),"0.03").
-0.5596157879354228:- algebraic_atom(18,2,0,set(p),bloodtype(p,ab),"0.03").
:- not algebraic_atom(18,3,0,set(p),bloodtype(p,null),"0.04").
-3.506557897319982:- not algebraic_atom(19,0,0,set(p),bloodtype(p,a),"0.03").
-0.030459207484708574:- algebraic_atom(19,0,0,set(p),bloodtype(p,a),"0.03").
-3.4760986898352733:- not algebraic_atom(19,1,0,set(p),bloodtype(p,b),"0.03").
-0.03141619623337893:- algebraic_atom(19,1,0,set(p),bloodtype(p,b),"0.03").
-0.04348511193973878:- not algebraic_atom(19,2,0,set(p),bloodtype(p,ab),"0.90").
-3.1570004211501144:- algebraic_atom(19,2,0,set(p),bloodtype(p,ab),"0.90").
:- not algebraic_atom(19,3,0,set(p),bloodtype(p,null),"0.04").
-0.10536051565782628:- not algebraic_atom(20,0,0,set(p),bloodtype(p,a),"0.90").
-2.302585092994046:- algebraic_atom(20,0,0,set(p),bloodtype(p,a),"0.90").
-0.9162907318741549:- not algebraic_atom(20,1,0,set(p),bloodtype(p,b),"0.04").
-0.5108256237659909:- algebraic_atom(20,1,0,set(p),bloodtype(p,b),"0.04").
-0.6931471805599448:- not algebraic_atom(20,2,0,set(p),bloodtype(p,ab),"0.03").
-0.6931471805599457:- algebraic_atom(20,2,0,set(p),bloodtype(p,ab),"0.03").
:- not algebraic_atom(20,3,0,set(p),bloodtype(p,null),"0.03").
-3.506557897319982:- not algebraic_atom(21,0,0,set(p),bloodtype(p,a),"0.03").
-0.030459207484708574:- algebraic_atom(21,0,0,set(p),bloodtype(p,a),"0.03").
-3.4760986898352733:- not algebraic_atom(21,1,0,set(p),bloodtype(p,b),"0.03").
-0.03141619623337893:- algebraic_atom(21,1,0,set(p),bloodtype(p,b),"0.03").
-0.04348511193973878:- not algebraic_atom(21,2,0,set(p),bloodtype(p,ab),"0.90").
-3.1570004211501144:- algebraic_atom(21,2,0,set(p),bloodtype(p,ab),"0.90").
:- not algebraic_atom(21,3,0,set(p),bloodtype(p,null),"0.04").
-3.2188758248682006:- not algebraic_atom(22,0,0,set(p),bloodtype(p,a),"0.04").
-0.040821994520255166:- algebraic_atom(22,0,0,set(p),bloodtype(p,a),"0.04").
-0.06453852113757105:- not algebraic_atom(22,1,0,set(p),bloodtype(p,b),"0.90").
-2.772588722239783:- algebraic_atom(22,1,0,set(p),bloodtype(p,b),"0.90").
-0.6931471805599444:- not algebraic_atom(22,2,0,set(p),bloodtype(p,ab),"0.03").
-0.6931471805599462:- algebraic_atom(22,2,0,set(p),bloodtype(p,ab),"0.03").
:- not algebraic_atom(22,3,0,set(p),bloodtype(p,null),"0.03").
-3.506557897319982:- not algebraic_atom(23,0,0,set(p),bloodtype(p,a),"0.03").
-0.030459207484708574:- algebraic_atom(23,0,0,set(p),bloodtype(p,a),"0.03").
-0.07490130817311771:- not algebraic_atom(23,1,0,set(p),bloodtype(p,b),"0.90").
-2.62880082944807:- algebraic_atom(23,1,0,set(p),bloodtype(p,b),"0.90").
-0.559615787935422:- not algebraic_atom(23,2,0,set(p),bloodtype(p,ab),"0.04").
-0.8472978603872046:- algebraic_atom(23,2,0,set(p),bloodtype(p,ab),"0.04").
:- not algebraic_atom(23,3,0,set(p),bloodtype(p,null),"0.03").
-0.10536051565782628:- not algebraic_atom(24,0,0,set(p),bloodtype(p,a),"0.90").
-2.302585092994046:- algebraic_atom(24,0,0,set(p),bloodtype(p,a),"0.90").
-1.203972804325936:- not algebraic_atom(24,1,0,set(p),bloodtype(p,b),"0.03").
-0.35667494393873245:- algebraic_atom(24,1,0,set(p),bloodtype(p,b),"0.03").
-0.8472978603872034:- not algebraic_atom(24,2,0,set(p),bloodtype(p,ab),"0.03").
-0.5596157879354228:- algebraic_atom(24,2,0,set(p),bloodtype(p,ab),"0.03").
:- not algebraic_atom(24,3,0,set(p),bloodtype(p,null),"0.04").
-3.506557897319982:- not algebraic_atom(25,0,0,set(p),bloodtype(p,a),"0.03").
-0.030459207484708574:- algebraic_atom(25,0,0,set(p),bloodtype(p,a),"0.03").
-0.07490130817311771:- not algebraic_atom(25,1,0,set(p),bloodtype(p,b),"0.90").
-2.62880082944807:- algebraic_atom(25,1,0,set(p),bloodtype(p,b),"0.90").
-0.559615787935422:- not algebraic_atom(25,2,0,set(p),bloodtype(p,ab),"0.04").
-0.8472978603872046:- algebraic_atom(25,2,0,set(p),bloodtype(p,ab),"0.04").
:- not algebraic_atom(25,3,0,set(p),bloodtype(p,null),"0.03").
-3.506557897319982:- not algebraic_atom(26,0,0,set(p),bloodtype(p,a),"0.03").
-0.030459207484708574:- algebraic_atom(26,0,0,set(p),bloodtype(p,a),"0.03").
-3.188416617383492:- not algebraic_atom(26,1,0,set(p),bloodtype(p,b),"0.04").
-0.04211148535012685:- algebraic_atom(26,1,0,set(p),bloodtype(p,b),"0.04").
-3.4339872044851463:- not algebraic_atom(26,2,0,set(p),bloodtype(p,ab),"0.03").
-0.03278982282299084:- algebraic_atom(26,2,0,set(p),bloodtype(p,ab),"0.03").
:- not algebraic_atom(26,3,0,set(p),bloodtype(p,null),"0.90").
-1.2039728043259361:- not algebraic_atom(27,0,0,set(none),mchrom(p,a),"0.3").
-0.35667494393873245:- algebraic_atom(27,0,0,set(none),mchrom(p,a),"0.3").
-0.8472978603872036:- not algebraic_atom(27,1,0,set(none),mchrom(p,b),"0.3").
-0.5596157879354228:- algebraic_atom(27,1,0,set(none),mchrom(p,b),"0.3").
:- not algebraic_atom(27,2,0,set(none),mchrom(p,null),"0.4").
-1.2039728043259361:- not algebraic_atom(28,0,0,set(none),pchrom(p,a),"0.3").
-0.35667494393873245:- algebraic_atom(28,0,0,set(none),pchrom(p,a),"0.3").
-0.8472978603872036:- not algebraic_atom(28,1,0,set(none),pchrom(p,b),"0.3").
-0.5596157879354228:- algebraic_atom(28,1,0,set(none),pchrom(p,b),"0.3").
:- not algebraic_atom(28,2,0,set(none),pchrom(p,null),"0.4").
