using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class Problem2
{
  public static IEnumerable<int> merge(IEnumerable<int> input1, IEnumerable<int> input2, IEnumerable<int> input3)
  {

	  List<int> ans1 = new List<int>();
	  List<int> ans2 = new List<int>();
	  List<int> ans3 = new List<int>();
	  foreach( int i in input1){
		  if(i%3 == 0){
		  	ans1.Add(i);
		  }
	  }
	  foreach( int k in input2){
		  if(k%3 == 0){
		  	ans2.Add(k);
		  }
	  }
	  foreach( int j in input3){
		  if(j%3 == 0){
		  	ans3.Add(j);
		  }
	  }
	  var intersect = ans1.Intersect(ans2);
	  var ans = intersect.Intersect(ans3);

	  return ans;
  }

  public static void Main(string[] args)
  {
	  Random rnd = new Random();
	  var list1 = Enumerable.Range(1,10).Select(i=>(rnd.Next()%15)+1);
	  var list2 = Enumerable.Range(1,10).Select(i=>(rnd.Next()%15)+1);
	  var list3 = Enumerable.Range(1,10).Select(i=>(rnd.Next()%15)+1);
	  var answer = Problem2.merge(list1,list2,list3);
	  foreach( int i in answer )
	  {
		  Console.WriteLine(i);
	  }
  }
}
