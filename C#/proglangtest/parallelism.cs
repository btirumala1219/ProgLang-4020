using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

namespace ConsoleApplication6
{
	class Program
	{

		static double[] data = new double[40000000];
		static Thread[] thrd = new Thread[4];

		static void Main(string[] args)
		{

			DateTime firstStart = DateTime.Now;
			Parallel.For(0, data.Length, i =>
			{
				data[i] = Math.Cos(i) + Math.Sin(i) + Math.Tan(i) + Math.Cosh(i) + Math.Sinh(i) + Math.Tanh(i);
			});
			TimeSpan firstTs = DateTime.Now - firstStart;
			Console.WriteLine("MS:{0}", firstTs.TotalMilliseconds);


			int calcsPerIteration = data.Length / thrd.Length;

			DateTime start = DateTime.Now;
			int j = 0;
			for (int i = 0; i < thrd.Length; i++ )
			{
				thrd[i] = new Thread(new ThreadStart(() => doCalc(j++ * calcsPerIteration, calcsPerIteration)));
				thrd[i].Start();
				Thread.Sleep(1);
			}
			foreach( Thread thread in thrd )
			{
				thread.Join();
			}

			TimeSpan elapsed = DateTime.Now - start;

			Console.WriteLine("MS:{0}", elapsed.TotalMilliseconds);
		}

		static void doCalc( int startIndex, int count )
		{
			for (int i = startIndex; i < startIndex + count; i++)
			{
				data[i] = Math.Cos(i) + Math.Sin(i) + Math.Tan(i) + Math.Cosh(i) + Math.Sinh(i) + Math.Tanh(i);
			}
		}

	}
}
