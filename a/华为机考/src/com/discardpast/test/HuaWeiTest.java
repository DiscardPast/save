package com.discardpast.test;

import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class HuaWeiTest {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String input1 = scanner.nextLine();
        String input2 = scanner.nextLine();
        boolean result = isContains(input1,input2);
        System.out.println(result);
    }

    private static boolean isContains(String input1,String input2){
        boolean result = true;
        int input1Length = input1.length();
        int input2Length = input2.length();

        //字符串输入最小长度
        int minLength = 5;
        //判断输入
        if(input1Length <= input2Length || input1Length < minLength || input2Length < minLength)
        {
            result = false;
        }

        Set<Character> input1CharSet = new HashSet<>();
        Set<Character> input2CharSet = new HashSet<>();
        char[] input1CharArray = input1.toCharArray();
        char[] input2CharArray = input2.toCharArray();
        for (char ch:input1CharArray) {
            input1CharSet.add(ch);
        }
        for (char ch:input2CharArray) {
            input2CharSet.add(ch);
        }
        result = input1CharSet.containsAll(input2CharSet);

        return result;
    }
}
