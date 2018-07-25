using System;
using System.Threading;

namespace ConsoleApp1
{
    class Program
    {
        static double[] data = new double[10000000];
        static Thread[] thrd = new Thread[4];

        static void Main(string[] args)
        {
            int quarterCount = data.Length / thrd.Length;
            DateTime start = DateTime.Now;
            int j = 0;
            for(int i = 0; i<thrd.Length; i++)
            {
                thrd[i] = new Thread(new ThreadStart(() => calcValues(j++ * quarterCount, quarterCount)));
                thrd[i].Start();
            }

            foreach(Thread t in thrd)
            {
                t.Join();
            }
  
            TimeSpan ts = DateTime.Now - start;
            Console.WriteLine("{0}", ts.TotalMilliseconds);

        }

        static void calcValues(int startingIndex, int reps)
        {
            // assign into the data array from startingIndex to
            // startingIndex + reps the following:
            // Math.Atan(i) * Math.Acos(i) * Math.Cos(i) * Math.Sin(i);

            for(int i = startingIndex; i<startingIndex + reps; i++)
            {
                data[i] = Math.Atan(i) * Math.Acos(i) * Math.Cos(i) * Math.Sin(i);
            }
        }
    }
}
