[int]->(int->int)->[int] map;

map = \([int] list) -> {
	\(int->int fun) -> {
		if(isEmpty list) {
			return [];
		}
		else {
			return (fun (head list)) cons (map (tail list) fun);
		}
	};
};

[int] -> (int -> ()) -> () forEach;
forEach = \([int] list) -> {
	\(int->() fun) -> {
		if (isEmpty list) {
			return ();
		}
		else {
			fun (head list);
			return forEach (tail list) fun;
		}
	};
}; 

int -> () printFun;
printFun = \(int x) -> {
	print x;
	return ();
};

() -> void exampleUnitFun;
exampleUnitFun = \() -> {
	print 1234;
}; 

exampleUnitFun ();

[int] testList;
testList = 5 cons (6 cons (7 cons []));

int->int testFun;
testFun = \(int x)-> {
	x+1;
};

testList = map testList testFun;

forEach testList printFun;