int x = 0;
[char] fizz = "fizz";
[char] buzz = "buzz";


[char] concat ([char] lhs, [char] rhs)
{
  		if (isEmpty lhs) {
			return rhs;
		} else {
			return ((head lhs) cons (concat (tail lhs) rhs));
		}  
}


while (x < 100)
{
  if ((x % 5 == 0) && (x % 3 == 0))
  {
    print concat fizz buzz;
  }
  else
  {
    if ((x % 5 == 0) || (x % 3 == 0))
    {
      if (x % 3 == 0)
      {
        print fizz;
      }
      if (x % 5 == 0)
      {
        print buzz;
      }
    }
    else
    {
      print x;
    }

  }

  x = x + 1;
}
