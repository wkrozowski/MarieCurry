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

forEachChar "hello" printChar;