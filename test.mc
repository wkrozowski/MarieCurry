int->int->int f;
f = \(int x) -> {
	\(int y) -> {
		x+y;
	};
};

print f 2 4;

int -> int addTwo;

addTwo = f 2;

print addTwo 2;
