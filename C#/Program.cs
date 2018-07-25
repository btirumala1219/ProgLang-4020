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
            DateTime start = DateTime.Now;

            calcValues(0,10000000);
            TimeSpan ts = DateTime.Now - start;

            Console.WriteLine("Sequentially, calc takes " + "{0}" + " milliseconds to run", ts.TotalMilliseconds);

            start = DateTime.Now;

            int quarterCount = data.Length / thrd.Length;
            
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
            

            //calcValues(0,10000000);

            TimeSpan tts = DateTime.Now - start;
            Console.WriteLine("Multithreaded, calc takes " + "{0}" + " milliseconds to run", tts.TotalMilliseconds);

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
