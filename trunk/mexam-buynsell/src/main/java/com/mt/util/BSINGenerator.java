/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.util;

/**
 *
 * @author AmierHaider
 */
public class BSINGenerator {

    public static final int LENGTH = 13;
    protected static java.util.Random r = new java.util.Random();
    protected static char[] goodChar = {
//        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'j', 'k', 'm', 'n', 'o',
//        'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H','I', 'J', 'K', 'M', 'N', 'O',
        'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
        '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'
    };

    /*
     * Generate a Password object with a random password.
     */
    public static String getNext() {
        return getNext(LENGTH);
    }

    /*
     * Generate a Password object with a random password.
     */
    public static String getNext(int length) {
        if (length < 1) {
            throw new IllegalArgumentException(
                    "Invalid length " + length);
        }
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            sb.append(goodChar[r.nextInt(goodChar.length)]);
        }
        return sb.toString();
    }
}
