package day01;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/*
public class Solution {
	public static int[] runningSum(int[] nums) {
		int[] sum = new int[nums.length];
        sum[0] = nums[0];
		for(int i=1; i<nums.length; i++) {
			sum[i] = sum[i - 1] + nums[i];	
		}
		return sum;
    }
	public static void main(String[] args) {
		int[] nums = {1,2,3,4};
		int[] sum = new int[nums.length];
		sum = runningSum(nums); 
		System.out.print("[");
		for(int i=0; i<nums.length; i++) {
			System.out.print(sum[i] + ",");
		}
		System.out.println("]");
	}
}
*/
/*
public class Solution {
	public static String defangIPaddr(String address) {
		address = address.replace(".", "[.]");
		return address;
		
	}
	public static void main(String[] args) {
		String address = "1.1.1.1";
		String res;
		res = defangIPaddr(address);
		System.out.println(res);
	}
}
*/
/*
public class Solution{
	public static List<Boolean> kidsWithCandies(int[] candies, int extraCandies) {
		List<Boolean> list=new ArrayList<Boolean>(Arrays.asList(new Boolean[candies.length]));
		int max = 0, sum=0;
		for(int i=1; i<candies.length; i++) {
			if(candies[i]>candies[i-1])
				max = candies[i];
		}
		for(int i=0; i<candies.length; i++) {
			sum = candies[i]+extraCandies;
			if(sum > max) {
				Collections.fill(list, Boolean.TRUE);
			}
			else {
				Collections.fill(list, Boolean.FALSE);
			}
		}
		return list;
	}
	public static void main(String[] args) {
		int[] candies = {4,2,1,1,2};
		int extraCandies = 3;
		List<Boolean> res = new ArrayList<Boolean>(Arrays.asList(new Boolean[candies.length]));
		res = kidsWithCandies(candies, extraCandies);
		for(int i=0; i<candies.length; i++) {
			
		}
	}
}
*/