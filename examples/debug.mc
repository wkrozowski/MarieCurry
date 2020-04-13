[int] -> [int] -> [int] concatInt;
concatInt = \([int] lhs) -> {
	\([int] rhs) -> {
		if (isEmpty lhs) {
			return rhs;
		} else {
			return ((head lhs) cons (concatInt (tail lhs) rhs));
		}
	};
};

[int] -> (int->bool) -> [int] filterInt;
filterInt = \([int] list) -> {
	\(int->bool predicate) -> {
		if (isEmpty list) {
			return [];
		} else {
			[int] retVal;
			int tmp;
			tmp = (head list);
			if (predicate tmp) {
				retVal = tmp cons (filterInt (tail list) predicate);
			}
			else {
				retVal = (filterInt (tail list) predicate);
			}
			return retVal;
		}
	};
};

int -> int -> bool greaterOrEqual;
greaterOrEqual = \(int p) ->{
	\(int q) -> {
		return p<q;
	};
}; 

int -> int -> bool smaller;
smaller = \(int p) ->{
	\(int q) -> {
		return p>=q;
	};
}; 

[int] -> [int] quicksort;
quicksort = \([int] list) -> {
	if (isEmpty list) {
		return [];
	} else {
		int pivot;
		[int] retVal;
		pivot = head list;
		[int] rest;
		rest = tail list;
		if (isEmpty rest) {
			retVal = (pivot cons []);
		}
		else {
			[int] rhs;
			rhs =  (filterInt (rest) (greaterOrEqual pivot));
			[int] lhs;
			lhs =  (filterInt (rest) (smaller pivot));
                        [int] test;
			retVal = concatInt (concatInt (quicksort lhs) (pivot cons [])) (quicksort rhs);	
		}

		return retVal;
	}
};

[int] myList;
myList = 1 cons [];
int x;
x = 0;
while (x < 1)
{
        myList = x cons myList;
        x = x + 1;
}
print quicksort myList;