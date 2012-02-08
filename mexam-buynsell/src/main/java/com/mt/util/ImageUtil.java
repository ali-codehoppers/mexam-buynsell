/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.util;

import com.mt.hibernate.entities.Image;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import javax.imageio.ImageIO;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.imgscalr.Scalr;

public class ImageUtil {

    Properties prop = new Properties();
    private static final Logger logger = Logger.getLogger(ImageUtil.class);
    private static final int SIZE_THUMBNAIIL = 150;
    private static final int SIZE_MEDIUM = 180;

    public ImageUtil() throws Exception {
        InputStream is = ImageUtil.class.getResourceAsStream("/image.properties");
        prop.load(is);
    }

    public boolean SaveImage(File image, String fileName, String extension) throws Exception {
//        String path = "D:\\Projects\\Java\\Mexam-BuynSell\\UploadedImages";
        String path = prop.getProperty("imagePath");
        File fileToCreate = new File(path, fileName + "." + extension);
        FileUtils.copyFile(image, fileToCreate);

        //java.awt.Image imageSrc = Toolkit.getDefaultToolkit().getImage(image.getPath());
        BufferedImage imageThumb = GetResizedImage(image, SIZE_THUMBNAIIL, SIZE_THUMBNAIIL);
        BufferedImage imageMedium = GetResizedImage(image, SIZE_MEDIUM, SIZE_MEDIUM);

        File fileToCreateThumb = new File(path, "t_" + fileName + "." + extension);
        File fileToCreateMedium = new File(path, "m_" + fileName + "." + extension);

        try {
            ImageIO.write(imageThumb, extension, fileToCreateThumb);  // ignore returned boolean
        } catch (IOException e) {
            throw e;
        }

        try {
            ImageIO.write(imageMedium, extension, fileToCreateMedium);  // ignore returned boolean
        } catch (IOException e) {
            throw e;
        }
        return true;
    }

    public byte[] GetImageBytes(Image image, EnumImageType imageType) throws Exception {
        String path = prop.getProperty("imagePath");
        //String path = "D:\\Projects\\Java\\Mexam-BuynSell\\UploadedImages";
        switch (imageType) {
            case Thumbnail:
                path += "\\" + "t_" + image.getFileName()+ "." + image.getExtension();
                break;
            case Medium:case Small:
                path += "\\" + "m_" + image.getFileName()+ "." + image.getExtension();
                break;
            case Large:case Original:
                path += "\\" + image.getFileName()+ "." + image.getExtension();
        }
        File file = new File(path);
        byte[] fileContent = new byte[(int) file.length()];
        FileInputStream fin = new FileInputStream(file);
        fin.read(fileContent);
        return fileContent;
    }

    public byte[] GetImageBytes(Image image) throws Exception {
        //String path = "D:\\Projects\\Java\\Mexam-BuynSell\\UploadedImages";
        String path = prop.getProperty("imagePath");
        path += "\\" + image.getFileName() + "." + image.getExtension();
        File file = new File(path);
        byte[] fileContent = new byte[(int) file.length()];
        FileInputStream fin = new FileInputStream(file);
        fin.read(fileContent);
        return fileContent;
    }

    private BufferedImage GetResizedImage(File srcImg, int width, int height) {


        BufferedImage imgSrc;
        BufferedImage imageDest;
        BufferedImage imageFinal = null;
        try {
            imgSrc = ImageIO.read(srcImg);
            imageDest = Scalr.resize(imgSrc, Scalr.Method.AUTOMATIC, Scalr.Mode.AUTOMATIC, width, height, Scalr.OP_ANTIALIAS);
            imageFinal = new BufferedImage(width,height,imageDest.getType());
            Graphics g = imageFinal.getGraphics();
            g.setColor(Color.WHITE);
            g.fillRect ( 0, 0, width, height);
            g.drawImage(imageDest, (width-imageDest.getWidth())/2 , (height-imageDest.getHeight())/2, null);
            g.dispose();
        } catch (IOException ex) {
            System.err.println(ex.getMessage());
            ex.printStackTrace();
        }

        return imageFinal;
    }
}
