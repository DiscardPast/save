package com.discardpast.louwailou.domain;

import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @apiNote 房屋信息图片表(HouseApartmenimage)实体类
 * @author discardpast@yeah.net
 * @since 2019-10-31 11:59:36
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_house_apartment_image")
@ApiModel(value = "HouseApartmenimage",description = "房屋信息图片表")
public class HouseApartmenimage{

    /** 主键id */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(name="id",value = "主键id")
    private Long id;

    /** 房屋id */
    @TableField(value="house_id")
    @ApiModelProperty(name="houseId",value = "房屋id")
    private Long houseId;

    /** 房屋图片地址 */
    @TableField(value="image_url")
    @ApiModelProperty(name="imageUrl",value = "房屋图片地址")
    private String imageUrl;

    /** 创建时间 */
    @TableField(value="create_time")
    @ApiModelProperty(name="createTime",value = "创建时间")
    private Date createTime;

    /** 更新时间 */
    @TableField(value="update_time")
    @ApiModelProperty(name="updateTime",value = "更新时间")
    private Date updateTime;

    /** 删除标识 */
    @TableField(value="deleted")
    @ApiModelProperty(name="deleted",value = "删除标识")
    private Boolean deleted;


}
