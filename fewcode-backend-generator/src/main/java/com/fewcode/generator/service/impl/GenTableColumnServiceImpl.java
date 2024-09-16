package com.fewcode.generator.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fewcode.generator.bean.GenTableColumn;
import com.fewcode.generator.mapper.GenTableColumnMapper;
import com.fewcode.generator.service.IGenTableColumnService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 代码生成-代码生成业务表字段 服务实现类
 * </p>
 *
 * @author 文艺倾年
 * @since 2021-12-30
 */
@Service
@AllArgsConstructor
public class GenTableColumnServiceImpl extends ServiceImpl<GenTableColumnMapper, GenTableColumn> implements IGenTableColumnService {

    private final GenTableColumnMapper genTableColumnMapper;

    @Override
    public List<GenTableColumn> selectListByTableId(Long tableId) {
        return genTableColumnMapper.selectList(Wrappers.lambdaQuery(GenTableColumn.class)
                .eq(GenTableColumn::getTableId, tableId));
    }
}
