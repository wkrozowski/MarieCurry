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
			rhs = (filterInt (rest) (greaterOrEqual pivot));

			[int] lhs;
			lhs = (filterInt (rest) (smaller pivot));
			retVal = concatInt (concatInt (quicksort lhs) (pivot cons [])) (quicksort rhs);	
		}

		return retVal;
	}
};



[int]->(int->int)->[int] mapInt;
mapInt = \([int] list) -> {
	\(int->int fun) -> {
		if(isEmpty list) {
			return [];
		}
		else {
			return (fun (head list)) cons (mapInt (tail list) fun);
		}
	};
};

[int] -> (int -> ()) -> () forEachInt;
forEachInt = \([int] list) -> {
	\(int->() fun) -> {
		if (isEmpty list) {
			return ();
		}
		else {
			fun (head list);
			return forEachInt (tail list) fun;
		}
	};
}; 

[char] -> (char -> ()) -> () forEachChar;
forEachChar = \([char] list) -> {
	\(char->() fun) -> {
		if (isEmpty list) {
			return ();
		}
		else {
			fun (head list);
			return forEachChar (tail list) fun;
		}
	};
}; 

int -> () printInt;
printInt = \(int x) -> {
	print x;
	return ();
};

char -> () printChar;
printChar = \(char x) -> {
	print x;
	return ();
};

[char] -> [char] -> [char] concat;
concat = \([char] lhs) -> {
	\([char] rhs) -> {
		if (isEmpty lhs) {
			return rhs;
		} else {
			return ((head lhs) cons (concat (tail lhs) rhs));
		}
	};
};

[int] -> [int] -> [(int,int)] zip;
zip = \([int] list1) -> {
    \([int] list2) -> {
        if((isEmpty list1) || (isEmpty list2)) {
            return [];
        }
        else {
            return (head list1, head list2) cons (zip (tail list1) (tail list2));
        }
    };
};