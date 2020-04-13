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

[int] list1;
list1 = 5 cons (4 cons []);

[int] list2;
list2 = 1 cons (7 cons []);

print list1;
print list2;