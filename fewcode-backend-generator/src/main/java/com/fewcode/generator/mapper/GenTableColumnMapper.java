package com.fewcode.generator.mapper;

import com.fewcode.generator.bean.GenTableColumn;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fewcode.generator.vo.model.GenTableColumnModel;

import java.util.List;

/**
 * <p>
 * 代码生成-代码生成业务表字段 Mapper 接口
 * </p>
 *
 * @author 文艺倾年
 * @since 2021-12-30
 */
public interface GenTableColumnMapper extends BaseMapper<GenTableColumn> {

    List<GenTableColumnModel> selectDbTableColumnsByName(String tableName);
}
