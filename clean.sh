for i in `ls *.pl`
do
	sed 's/.*:- use_module(library(pita))\..*//' $i |
		sed 's/.*:- begin_lpad\..*//' |
		sed 's/.*:- end_lpad\..*//' |
		sed 's/.*:- pita\..*//'  |
		sed 's/map_query //' |
	       	sed 's/ev :- a0./query(a0)./' |
	       	sed 's/ev :- bloodtype(p,a)./query(bloodtype(p,a))./' > ../blood_problog/$i
done

