/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.util.Base64;

/**
 *
 * @author Administrator
 */
public class Reuseable {
    public static String loadImage(byte[] imageData){
        return "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageData);
    }
}
