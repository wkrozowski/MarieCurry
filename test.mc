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

[int] testList;
testList = 5 cons (6 cons (7 cons []));

int->int testFun;
testFun = \(int x)-> {
	x+1;
};

map testList testFun;
