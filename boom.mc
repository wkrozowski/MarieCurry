int -> int inc;
inc = \(int x) -> {
    x+1;
};

int -> int -> int add;
add = \(int x) -> {
    \(int y) -> {
        if(x>0) {
            y;
        }
        else {
           inc (add (inc x) y);
        }
    };
};

int a;
a = -2;
print add a 9;