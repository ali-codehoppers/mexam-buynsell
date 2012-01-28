/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions;

import com.mt.hibernate.entities.Image;
import com.mt.services.ImageService;
import com.mt.util.EnumImageType;
import com.mt.util.ImageUtil;
import com.opensymphony.xwork2.ActionSupport;
import java.io.OutputStream;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author CodeHopper
 */
public class GetImage extends ActionSupport {

    private int imageId;
    private Image imageObj;
    private byte[] image;
    private ImageService imageService;
    private int imageType = 0;

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public void setImageType(int imageType) {
        this.imageType = imageType;
    }

    public void setImageService(ImageService imageService) {
        this.imageService = imageService;
    }

    @Override
    public String execute() throws Exception {
        imageObj = imageService.getById(imageId);

        if (imageType == 1) {
            image = new ImageUtil().GetImageBytes(imageObj, EnumImageType.Thumbnail);
        } else if (imageType == 2) {
            image = new ImageUtil().GetImageBytes(imageObj, EnumImageType.Small);
        } else if (imageType == 3) {
            image = new ImageUtil().GetImageBytes(imageObj, EnumImageType.Medium);
        } else {
            image = new ImageUtil().GetImageBytes(imageObj, EnumImageType.Original);
        }

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("image/jpg");
        OutputStream out = response.getOutputStream();
        out.write(image);
        return null;
    }

    public ImageService getImageService() {
        return imageService;
    }

    public byte[] getImage() {
        return image;
    }
}
