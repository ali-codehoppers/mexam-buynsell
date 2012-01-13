/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.util;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class Encryption {

    private static String KEY = "CodeHoppers";

    public static String Encrypt(String plainText) throws Exception {

        Cipher encryptCipher = Cipher.getInstance("AES");
        SecretKeySpec secretKey = new SecretKeySpec(KEY.getBytes(), "AES");
        encryptCipher.init(Cipher.ENCRYPT_MODE, secretKey);
        byte[] ciphertext = encryptCipher.doFinal(plainText.getBytes());
        return ciphertext.toString();
    }

    public static String Decrypt(String ciphertext) throws Exception {
        Cipher decryptCipher = Cipher.getInstance("AES");
        SecretKeySpec secretKey = new SecretKeySpec(KEY.getBytes(), "AES");
        decryptCipher.init(Cipher.DECRYPT_MODE, secretKey);
        byte[] deciphertext = decryptCipher.doFinal(ciphertext.getBytes());
        return deciphertext.toString();
    }
}
