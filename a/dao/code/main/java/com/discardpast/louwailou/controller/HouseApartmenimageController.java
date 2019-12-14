package com.discardpast.louwailou.controller;

import com.baomidou.mybatisplus.plugins.Page;
import com.discardpast.louwailou.domain.HouseApartmenimage;
import com.discardpast.louwailou.service.HouseApartmenimageService;
import com.hrabl.common.base.BaseController;
import com.hrabl.common.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 房屋信息图片表(HouseApartmenimage)表控制层
 *
 * @author discardpast@yeah.net
 * @since 2019-10-31 11:59:36
 */
@Api(value = "房屋信息图片表接口", tags = "房屋信息图片表模块")
@RestController
@RequestMapping("/v2/houseApartmenimage")
public class HouseApartmenimageController extends BaseController {

    @Resource
    private HouseApartmenimageService houseApartmenimageService;

    /**
     * 分页查询所有房屋信息图片表数据
     *
     * @param page 分页对象
     * @param houseApartmenimage 查询实体
     * @return Result 返回统一结果model
     */
    @ApiOperation(value = "查询房屋信息图片表列表", notes = "查询房屋信息图片表列表", response = Result.class)
    @GetMapping
    public Result selectAll(Page<HouseApartmenimage> page, HouseApartmenimage houseApartmenimage) {
        return Result.success(this.houseApartmenimageService.queryByPage(page,houseApartmenimage));
    }

    /**
     * 通过主键查询单条房屋信息图片表数据
     *
     * @param houseApartmenimageId 主键
     * @return Result 返回统一结果model
     */
    @ApiOperation(value = "查询房屋信息图片表", notes = "查询房屋信息图片表", response = Result.class)
    @GetMapping("{houseApartmenimageId}")
    public Result selectOne(
            @ApiParam(name = "houseApartmenimageId", value = "主键", required = true, example = "1")
            @PathVariable Long houseApartmenimageId) {
        return Result.success(this.houseApartmenimageService.queryById(houseApartmenimageId));
    }

    /**
     * 保存房屋信息图片表数据
     *
     * @param houseApartmenimage 实体对象
     * @return Result 返回统一结果model
     */
    @ApiOperation(value = "保存房屋信息图片表", notes = "保存房屋信息图片表", response = Result.class)
    @PostMapping
    public Result insert(
            @ApiParam(name = "houseApartmenimage", value = "传入json格式", required = true)
            @RequestBody HouseApartmenimage houseApartmenimage) {
        return Result.success(this.houseApartmenimageService.addHouseApartmenimage(houseApartmenimage));
    }

    /**
     * 修改房屋信息图片表数据
     *
     * @param houseApartmenimage 实体对象
     * @return Result 返回统一结果model
     */
    @ApiOperation(value = "修改房屋信息图片表", notes = "修改房屋信息图片表", response = Result.class)
    @PutMapping
    public Result update(
            @ApiParam(name = "houseApartmenimage", value = "传入json格式", required = true)
            @RequestBody HouseApartmenimage houseApartmenimage) {
        return Result.success(this.houseApartmenimageService.updateHouseApartmenimage(houseApartmenimage));
    }

}