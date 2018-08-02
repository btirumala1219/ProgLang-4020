using System;
using System.Collections.Generic;
using System;
using System.Linq;

namespace Test3
{
    class Program
    {
        public static IEnumerable<int> myFilter(IEnumerable<int> input)
        {
            List<int> ans = new List<int>();
            foreach (int i in input)
            {
                if (i % 5 == 0 && i > 50)
                {
                    continue;
                }
                var num = i * i * i;
                if (num % 2 == 0)
                {
                    continue;
                }
                ans.Add(num);
            }

            return ans;
        }

        public static void Main(string[] args)
        {
            Random rnd = new Random(); // Important to seed with 5 for repeatability.
            var listForProblem =
              Enumerable.Range(1, 100).Select(i => rnd.Next() % 101);
            var answer = Program.myFilter(listForProblem);
            foreach (int i in answer)
            {
                Console.WriteLine(i);
            }
        }
    }
}
